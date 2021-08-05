import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/app/changenotifier/app_state.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int index = 0;
  late final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> onIndexSelect(newIndex) async {
    switch (newIndex) {
      case 0:
        routemaster.push('/weather');
        setState(() {
          index = newIndex;
        });
        break;
      case 1:
        routemaster.push('/profile');
        setState(() {
          index = newIndex;
        });
        break;
      default:
        routemaster.push('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLogged =
        context.watch<AppState>().loggedInState == LoggedInState.loggedIn;
    if (isLogged) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              routemaster.push('/');
              setState(() {
                index = 0;
              });
            },
            child: SizedBox(
              width: 100,
              child: SvgPicture.asset(
                'assets/logo/patchai.svg',
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                getIt<AppState>().logOut();
              },
            )
          ],
        ),
        body: widget.child!,
        bottomNavigationBar: NavigationBottomBar(
          selectedIndex: index,
          onIndexSelect: onIndexSelect,
        ),
      );
    } else {
      return widget.child!;
    }
  }
}

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({
    Key? key,
    required this.selectedIndex,
    required this.onIndexSelect,
  }) : super(key: key);

  final Function(int) onIndexSelect;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onIndexSelect,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.wb_sunny),
          label: LocaleKeys.weather.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: LocaleKeys.profile.tr(),
        ),
      ],
    );
  }
}
