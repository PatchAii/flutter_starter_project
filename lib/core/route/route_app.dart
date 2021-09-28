import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/route/route_pages.dart';
import 'package:flutter_starter_project/feature/feature.dart';
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
            paths: ['/pokedex', '/profile', '/posts'],
          );
        }
      },
      '/pokedex': (_) => const MaterialPage(
            name: 'Pokedex',
            child: PokedexPage(),
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
      '/settings': (_) => const SwipableBackPage(
            name: 'Settings',
            child: SettingsPage(),
          ),
      '/posts': (route) => MaterialPage(
            child: PostsPage(userId: route.queryParameters['userId']),
          ),
      '/dialog': (route) => DialogPage(
            child: GenericDialog(
                title: route.queryParameters['title'] ?? '',
                subtitle: route.queryParameters['subtitle'],
                description: route.queryParameters['description']),
          ),
      '/notificationpermission': (route) => const DialogPage(
            child: NotificationPermissionDialog(),
          ),
      '/settings/bottomsheet': (_) => const BottomSheetPage(
            child: Material(
              child: Center(
                child: Text(
                  'settigs BottomSheet',
                ),
              ),
            ),
          ),
      '/profile/bottomsheet': (_) => const BottomSheetPage(
            heightPerc: .5,
            child: Material(
              child: Center(
                child: Text(
                  'profile BottomSheet',
                ),
              ),
            ),
          ),
      '/profile/notification': (_) => const SwipableBackPage(
            name: 'Notification',
            child: NotificationPage(
              subPage: true,
            ),
          ),
    },
  );

  static final loggedOutRoutes = RouteMap(
    onUnknownRoute: (_) => const Redirect('/'),
    routes: {
      '/': (route) => caruselHasBeenShown()
          ? const MaterialPage(
              name: 'Login',
              child: LoginPage(
                key: ValueKey('LoginPage'),
              ),
            )
          : MaterialPage(
              name: 'Carusel',
              child: Material(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<AppState>().setCaruselHasBeenShown(true);
                    },
                    child: const Text(
                      'Carusel',
                    ),
                  ),
                ),
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

  static bool caruselHasBeenShown() => getIt<AppState>().caruselHasBeenShown;

  static bool onBoardingRequired() =>
      getIt<AppState>().user?.onBoardRequired() ?? false;

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
