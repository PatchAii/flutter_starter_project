import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_starter_project/feature/common/app_loading.dart';
import 'package:rfw/rfw.dart';

class RemoteWidgetPage extends StatefulWidget {
  const RemoteWidgetPage({Key? key}) : super(key: key);

  @override
  State<RemoteWidgetPage> createState() => _RemoteWidgetPageState();
}

class _RemoteWidgetPageState extends State<RemoteWidgetPage> {
  final String urlPrefix =
      'https://raw.githubusercontent.com/flutter/packages/master/packages/rfw/example/remote/remote_widget_libraries';

  int _counter = 0;
  final DynamicContent _data = DynamicContent();
  bool _error = false;
  String _indexStr = '';
  bool _ready = false;
  final Runtime _runtime = Runtime();

  @override
  void initState() {
    super.initState();
    _runtime.update(
        const LibraryName(<String>['core', 'widgets']), createCoreWidgets());
    _runtime.update(const LibraryName(<String>['core', 'material']),
        createMaterialWidgets());
    _updateData();
    _updateWidgets();
  }

  void _updateData() {
    _data.update('counter', _counter.toString());
  }

  Future<void> _updateWidgets() async {
    try {
      final _index = Random().nextInt(2) + 1;
      final client = await (await HttpClient()
              .getUrl(Uri.parse('$urlPrefix/counter_app$_index.rfw')))
          .close();

      final ints = await client.expand((List<int> chunk) => chunk).toList();

      _runtime.update(const LibraryName(<String>['main']),
          decodeLibraryBlob(Uint8List.fromList(ints)));

      setState(() {
        _ready = true;
        _indexStr = _index.toString();
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget result;
    if (_ready) {
      result = RemoteWidget(
        runtime: _runtime,
        data: _data,
        widget: const FullyQualifiedWidgetName(
            LibraryName(<String>['main']), 'Counter'),
        onEvent: (String name, DynamicMap arguments) {
          if (name == 'increment') {
            _counter += 1;
            _updateData();
          }
        },
      );
    } else {
      result = const AppLoading();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Remote Widget ${_indexStr}'),
      ),
      body: !_error
          ? AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: result,
            )
          : const Center(
              child: Text(
                'error',
              ),
            ),
    );
  }
}
