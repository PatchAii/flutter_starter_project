import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dante/dante.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/profile_notification/repo/profile_notification_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();

  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) {
      Dante.e(error.toString(), error, stackTrace);
    },
  );
}

Future _initApp() async {
  final futures = <Future>[
    configureDependencies(),
    EasyLocalization.ensureInitialized(),
    dotenv.load(fileName: 'dotenv'),
    NotificationController.init(
      [
        ProfileNotificationController(),
      ],
    ),
  ];
  RouteApp.initRoutes();
  Bloc.observer = AppBlocObserver();
  EasyLocalization.logger.enableBuildModes = [];

  FlutterError.onError = (details) {
    Dante.e(details.exceptionAsString(), details.exception, details.stack);
  };

  await Future.wait(futures);
}
