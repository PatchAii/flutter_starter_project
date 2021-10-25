import 'package:bloc/bloc.dart';
import 'package:dante/dante.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/common/pin_binding.dart';
import 'package:layout/layout.dart';
import 'package:provider/provider.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Dante.d(
      ' *️⃣ ${bloc.runtimeType}\n ⏸ CurrentState: ${change.currentState}\n ⏯ NextState: ${change.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Dante.e('${bloc.runtimeType}\n$error\n$stackTrace');
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

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
        ChangeNotifierProvider(
          create: (context) => getIt<NavObserver>(),
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
    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      routeInformationParser: RouteApp.routeInformationParser,
      themeMode: ThemeMode.light,
      restorationScopeId: 'root',
      theme: ThemeData(
        primaryColor: const Color(0xFFcbfbcb),
        primaryColorDark: const Color(0xFF0c2d24),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFcbfbcb),
          secondary: Color(0xFFFDEC54),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xFF0c2d24),
          ),
          titleTextStyle: TextStyle(
            color: Color(0xFF0c2d24),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF0c2d24),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF0c2d24),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF0c2d24),
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF0c2d24),
          unselectedItemColor: Colors.grey,
        ),
        navigationRailTheme: const NavigationRailThemeData(
          selectedIconTheme: IconThemeData(
            color: Color(0xFF0c2d24),
          ),
          selectedLabelTextStyle: TextStyle(
            color: Color(0xFF0c2d24),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
          unselectedLabelTextStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: RouteApp.routemaster,
      builder: (context, child) {
        return Layout(
          format: MaterialLayoutFormat(),
          child: PinBinding(
            child: child!,
          ),
        );
      },
    );
  }
}
