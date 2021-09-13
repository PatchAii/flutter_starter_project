import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:layout/layout.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

var logger = Logger(
  printer: PrettyPrinter(
    printEmojis: false,
    methodCount: 0,
  ),
  filter: DevelopmentFilter(),
);

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d(
      ' *️⃣ ${bloc.runtimeType}\n ⏸ CurrentState: ${change.currentState}\n ⏯ NextState: ${change.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('${bloc.runtimeType}\n$error\n$stackTrace');
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
      child: const AppProvider(),
    );
  }
}

class AppProvider extends StatelessWidget {
  const AppProvider({
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
      child: const ConsumerApp(),
    );
  }
}

class ConsumerApp extends StatefulWidget {
  const ConsumerApp({
    Key? key,
  }) : super(key: key);

  @override
  _ConsumerAppState createState() => _ConsumerAppState();
}

class _ConsumerAppState extends State<ConsumerApp> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      format: MaterialLayoutFormat(),
      child: MaterialApp.router(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        routeInformationParser: RouteApp.routeInformationParser,
        themeMode: ThemeMode.light,
        theme: ThemeData(
<<<<<<< HEAD
          primaryColor: Colors.green,
          colorScheme: const ColorScheme.light(
            primary: Colors.green,
          ).copyWith(secondary: Colors.greenAccent),
=======
          primaryColor: const Color(0xFF6EC818),
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF6EC818),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
>>>>>>> main
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerDelegate: RouteApp.routemaster,
      ),
    );
  }
}
