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
            child: const AppScaffold(),
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
      '/profile/sub': (_) => const AnimationDisablePage(
            child: SettingsPage(
              subPage: true,
            ),
          ),
      //Se la route /settings appartiene a loggedInRoutes, per quale motivo e' necessario ricontrollare
      //che l'utente sia loggato? Suppongo sia in previsione di altri requisiti oltre allo stesso login.
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

class AnimationPage extends Page {
  const AnimationPage({required this.child});

  final Widget child;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: 0.0, end: 1.0);
        final curveTween = CurveTween(curve: Curves.easeInOut);

        return FadeTransition(
          opacity: animation.drive(curveTween).drive(tween),
          child: child,
        );
      },
    );
  }
}

class AnimationDisablePage extends Page {
  const AnimationDisablePage({required this.child});

  final Widget child;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      barrierDismissible: true,
      transitionDuration: const Duration(),
      pageBuilder: (_, __, ___) {
        return child;
      },
    );
  }
}
