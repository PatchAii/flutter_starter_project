import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_project/core/app/view/app_scaffold.dart';
import 'package:flutter_starter_project/core/common/notification_dialog.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/route/route_pages.dart';
import 'package:flutter_starter_project/feature/feature.dart';
import 'package:flutter_starter_project/feature/posts/view/posts_page.dart';
import 'package:flutter_starter_project/feature/profile/view/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class RouteApp {
  static final loggedInRoutes = RouteMap(
    onUnknownRoute: (route) {
      return SwipableBackPage(
        name: 'Not Found',
        child: NotFoundPage(
          route: route,
        ),
      );
    },
    routes: {
      '/': (_) {
        if (onBoardingRequired()) {
          return const SwipableBackPage(
            name: 'Onboarding',
            child: OnboardingPage(),
          );
        } else {
          return TabPage(
            pageBuilder: (child) => MaterialPage(
              child: child,
            ),
            child: const AppScaffold(),
            paths: ['/weather', '/profile', '/posts'],
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
      '/profile/sub': (_) => const SwipableBackPage(
            name: 'Settings Sub Page',
            child: SettingsPage(
              subPage: true,
            ),
          ),
      '/settings': (_) => canUserAccessPage()
          ? const SwipableBackPage(
              name: 'Settings',
              child: SettingsPage(),
            )
          : const MaterialPage(
              name: 'AccessDenied',
              child: NotFoundPage(
                route: 'AccessDenied',
              ),
            ),
<<<<<<< HEAD
      '/posts': (route) => MaterialPage(
            child: PostsPage(userId: route.queryParameters['userId']),
          ),
      '/notification': (route) => DialogPage(
            child: NotificationDialog(
                title: route.queryParameters['title'] ?? '',
                subtitle: route.queryParameters['subtitle'],
                description: route.queryParameters['description']),
          ),
      '/bottom': (route) => const BottomSheetPage(
            child: Text(''),
          ),
=======
      '/settings/bottomsheet': (_) => BottomSheetPage(
            child: Container(
              color: Colors.greenAccent,
              child: const Center(
                child: Text(
                  'settigs BottomSheet',
                ),
              ),
            ),
          ),
      '/profile/bottomsheet': (_) => BottomSheetPage(
            heightPerc: .5,
            child: Container(
              color: Colors.orange,
              child: const Center(
                child: Text(
                  'profile BottomSheet',
                ),
              ),
            ),
          )
>>>>>>> main
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
<<<<<<< HEAD

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
  const AnimationDisablePage({
    required this.child,
  });

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

class DialogPage extends Page<void> {
  final Widget child;

  const DialogPage({
    required this.child,
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      builder: (context) => child,
      settings: this,
    );
  }
}

class BottomSheetPage extends Page<void> {
  final Widget child;

  const BottomSheetPage({required this.child});

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
        builder: (context) {
          return Container(
            height: 300.0,
            color: Colors.red,
          );
        },
        settings: this,
        fullscreenDialog: true);
  }
}
=======
>>>>>>> main
