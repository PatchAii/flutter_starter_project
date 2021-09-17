import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_project/core/app/view/app_scaffold.dart';
import 'package:flutter_starter_project/core/common/generic_dialog.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/notification/notification_permission_dialog.dart';
import 'package:flutter_starter_project/core/route/route_pages.dart';
import 'package:flutter_starter_project/feature/feature.dart';
import 'package:flutter_starter_project/feature/notification/notification_view.dart';
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
          ),
      '/notification': (_) => const MaterialPage(
            name: 'Notification',
            child: NotificationPage(),
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
