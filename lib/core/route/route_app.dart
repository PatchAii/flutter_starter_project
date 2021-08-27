import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_project/core/app/view/app_scaffold.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/feature.dart';
import 'package:flutter_starter_project/feature/profile/view/profile_page.dart';
import 'package:routemaster/routemaster.dart';
import 'package:provider/provider.dart';

class RouteApp {
  static final loggedInRoutes = RouteMap(
    onUnknownRoute: (route) {
      return MaterialPage(
        name: 'Not Found',
        child: NotFoundPage(
          route: route,
        ),
      );
    },
    routes: {
      '/': (_) {
        if (onBoardingRequired()) {
          return const MaterialPage(
            name: 'OnBoarding',
            child: OnboardingPage(),
          );
        } else {
          return TabPage(
            pageBuilder: (child) => NoAnimationPage(child: child),
            child: const AppScaffold(
              children: [
                WeatherPage(
                  key: ValueKey('WeatherPage'),
                ),
                ProfilePage(
                  key: ValueKey('ProfilePage'),
                ),
              ],
            ),
            paths: ['/weather', '/profile'],
          );
        }
      },
      '/weather': (_) => const MaterialPage(
            name: 'Weather',
            child: WeatherPage(),
          ),
      '/profile': (_) => const MaterialPage(
            name: 'Profile',
            child: ProfilePage(),
          ),
      '/settings': (_) => canUserAccessPage()
          ? const MaterialPage(
              name: 'Settings',
              child: SettingsPage(),
            )
          : const MaterialPage(
              name: 'AccessDenied',
              child: NotFoundPage(
                route: 'AccessDenied',
              ),
            ),
    },
  );

  static final loggedOutRoutes = RouteMap(
    onUnknownRoute: (_) => const Redirect('/'),
    routes: {
      '/': (route) => const MaterialPage(
            name: 'Login',
            child: LoginPage(
              key: ValueKey('LoginPage'),
            ),
          ),
    },
  );

  static const routeInformationParser = RoutemasterParser();
  static final routemaster = RoutemasterDelegate(
    observers: [
      RouteAppObsever(),
      RouteAppTitleObserver(),
    ],
    routesBuilder: (context) {
      switch (context.watch<AppState>().loggedInState) {
        case LoggedState.loggedOut:
          return loggedOutRoutes;
        case LoggedState.loggedIn:
          return loggedInRoutes;
      }
    },
  );

  static bool canUserAccessPage() =>
      getIt<AppState>().loggedInState == LoggedState.loggedIn;

  static bool onBoardingRequired() => getIt<AppState>().onBoardRequired();

  static void initRoutes() {
    Routemaster.setPathUrlStrategy();
  }

  static bool showRouteWidget(BuildContext context) {
    final isLogged =
        context.watch<AppState>().loggedInState == LoggedState.loggedIn;
    return isLogged;
  }
}

class RouteAppObsever extends RoutemasterObserver {
  @override
  void didChangeRoute(RouteData routeData, Page page) {
    //print('New route: ${routeData.path}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    //print('Popped a route');
  }
}

class RouteAppTitleObserver extends RoutemasterObserver {
  @override
  void didChangeRoute(RouteData routeData, Page page) {
    if (page.name != null) {
      SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
          label: page.name,
          primaryColor: 0x00000000,
        ),
      );
    }
  }
}

class NoAnimationPage<T> extends TransitionPage<T> {
  NoAnimationPage({required Widget child})
      : super(
          child: child,
          pushTransition: PageTransition.none,
          popTransition: PageTransition.none,
        );
}
