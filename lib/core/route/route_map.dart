import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/feature.dart';
import 'package:flutter_starter_project/feature/profile/view/profile_page.dart';
import 'package:routemaster/routemaster.dart';
import 'package:provider/provider.dart';

final routemaster = RoutemasterDelegate(
  routesBuilder: (context) {
    switch (context.watch<AppState>().loggedInState) {
      case LoggedState.loggedOut:
        return loggedOutRoutes;
      case LoggedState.loggedIn:
        return loggedInRoutes;
    }
  },
);

final loggedOutRoutes = RouteMap(
  onUnknownRoute: (_) => const Redirect('/'),
  routes: {
    '/': (routeData) => const Redirect('/login'),
    '/login': (route) => const MaterialPage(
          name: 'Login',
          child: LoginPage(
            title: 'login',
          ),
        ),
  },
);

final loggedInRoutes = RouteMap(
  onUnknownRoute: (_) => const Redirect('/weather'),
  routes: {
    '/weather': (_) => const MaterialPage(
          name: 'Weather',
          child: WeatherPage(),
        ),
    '/profile': (_) => const MaterialPage(
          name: 'Profile',
          child: ProfilePage(),
        ),
    '/settings': (_) => MaterialPage(
          name: 'Settings',
          child: Center(
            child: Container(
              height: 200,
              width: 300,
              color: Colors.green,
            ),
          ),
        ),
  },
);
