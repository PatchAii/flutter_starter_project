import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/route/route_pages.dart';
import 'package:flutter_starter_project/feature/common/top_bar.dart';
import 'package:flutter_starter_project/feature/feature.dart';
import 'package:injectable/injectable.dart';
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
        return onBoardingRequired()
            ? const SwipableBackPage(
                name: 'Onboarding',
                child: OnboardingPage(),
              )
            : TabPage(
                pageBuilder: (child) => MaterialPage(child: child),
                backBehavior:
                    kIsWeb ? TabBackBehavior.history : TabBackBehavior.none,
                child: const AppScaffold(),
                paths: tabRoutes,
              );
      },
      '/dialog': (route) => DialogPage(
            child: GenericDialog(
              title: route.queryParameters['title'] ?? '',
              subtitle: route.queryParameters['subtitle'],
              description: route.queryParameters['description'],
            ),
          ),
      '/notification-permission': (route) => const DialogPage(
            child: NotificationPermissionDialog(),
          ),
      '/pokedex': (_) => const MaterialPage(
            name: 'Pokedex',
            child: PokedexPage(),
          ),
      '/posts': (route) => MaterialPage(
            name: 'Posts',
            child: PostsPage(userId: route.queryParameters['userId']),
          ),
      '/profile': (_) => const MaterialPage(
            name: 'Profile',
            child: ProfilePage(),
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
      '/settings/bottomsheet': (_) => const BottomSheetPage(
            child: Material(
              child: Center(
                child: Text(
                  'settigs BottomSheet',
                ),
              ),
            ),
          ),
    },
  );

  static final loggedOutRoutes = RouteMap(
    onUnknownRoute: (_) => const Redirect('/'),
    routes: {
      '/': (route) => carouselHasBeenShown()
          ? const MaterialPage(
              name: 'Login',
              child: LoginPage(
                key: ValueKey('LoginPage'),
              ),
            )
          : MaterialPage(
              name: 'Carousel',
              child: Scaffold(
                appBar: const TopBar(
                  label: 'Carousel',
                ),
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      getIt<AppState>().setCarouselHasBeenShown(true);
                    },
                    child: const Text(
                      'Carousel',
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
      RouteAppTitleObserver(),
      getIt<NavObserver>(),
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

  static const tabRoutes = [
    '/pokedex',
    '/profile',
    '/posts',
  ];

  static bool carouselHasBeenShown() => getIt<AppState>().carouselHasBeenShown;

  static void initRoutes() {
    Routemaster.setPathUrlStrategy();
  }

  static bool onBoardingRequired() =>
      getIt<AppState>().user?.onBoardRequired() ?? false;
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

@singleton
class NavObserver extends RoutemasterObserver with ChangeNotifier {
  bool _back = false;

  @override
  void didChangeRoute(RouteData routeData, Page page) {
    final paths = routeData.fullPath.substring(1).split('/');
    paths.removeWhere(
      (path) => RouteApp.tabRoutes.contains('/$path'),
    );
    _back = paths.isNotEmpty;

    notifyListeners();
  }

  bool get enableBackButton {
    return _back;
  }
}
