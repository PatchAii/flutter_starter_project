import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_starter_project/core/app/changenotifier/app_state.dart';
import 'package:flutter_starter_project/core/app/view/app_scaffold.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/lang/lang.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [
        const Locale('en'),
        const Locale('it'),
      ],
      fallbackLocale: const Locale('en', 'US'),
      useOnlyLangCode: true,
      path: 'translations',
      assetLoader: const CodegenLoader(),
      child: const _ThemeApp(),
    );
  }
}

class _ThemeApp extends StatelessWidget {
  const _ThemeApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt<AppState>(),
        ),
      ],
      child: const _ThemeConsumerApp(),
    );
  }
}

class _ThemeConsumerApp extends StatefulWidget {
  const _ThemeConsumerApp({
    Key? key,
  }) : super(key: key);

  @override
  __ThemeConsumerAppState createState() => __ThemeConsumerAppState();
}

class __ThemeConsumerAppState extends State<_ThemeConsumerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: const RoutemasterParser(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
        colorScheme: const ColorScheme.light(
          primary: Colors.green,
        ),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: routemaster,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => AppScaffold(
                child: child,
              ),
            ),
          ],
        );
      },
    );
  }
}
