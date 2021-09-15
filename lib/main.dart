import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter_project/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();

  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}

Future _initApp() async {
  final futures = <Future>[
    configureDependencies(),
    EasyLocalization.ensureInitialized(),
    dotenv.load(fileName: 'dotenv'),
    NotificationController.init(),
  ];
  RouteApp.initRoutes();
  Bloc.observer = AppBlocObserver();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await Future.wait(futures);
}
