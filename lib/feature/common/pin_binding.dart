import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:provider/src/provider.dart';

class PinBinding extends StatefulWidget {
  const PinBinding({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  _PinBindingState createState() => _PinBindingState();
}

class _PinBindingState extends State<PinBinding> with WidgetsBindingObserver {
  bool pinShow = dotenv.env['ENVIRONMENT'] != 'dev' &&
      true &&
      getIt<AppState>().loggedInState == LoggedState.loggedIn;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          top: pinShow ? 0 : -MediaQuery.of(context).size.height / 2,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 250),
          bottom: pinShow ? 0 : -MediaQuery.of(context).size.height / 2,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
          ),
        ),
        if (pinShow)
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  pinShow = false;
                });
              },
              child: const Text('pin'),
            ),
          ),
      ],
    );
  }

  @override
  Future<void> didChangeAppLifecycleState(
    AppLifecycleState appLifecycleState,
  ) async {
    switch (appLifecycleState) {
      case AppLifecycleState.resumed:
        break;

      case AppLifecycleState.inactive:
        break;

      case AppLifecycleState.paused:
        setState(() {
          pinShow = dotenv.env['ENVIRONMENT'] != 'dev' &&
              true &&
              getIt<AppState>().loggedInState == LoggedState.loggedIn;
        });
        break;

      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void didChangeDependencies() {
    final isLogged =
        context.watch<AppState>().loggedInState == LoggedState.loggedIn;
    if (!isLogged) {
      setState(() {
        pinShow = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }
}
