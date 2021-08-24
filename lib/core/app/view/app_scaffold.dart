import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/app/changenotifier/app_state.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/route/route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routemaster/routemaster.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  Future<void> onIndexSelect(newIndex) async {
    switch (newIndex) {
      case 0:
        RouteApp.routemaster.push('/weather');
        break;
      case 1:
        RouteApp.routemaster.push('/profile');
        break;
      default:
        RouteApp.routemaster.push('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = TabPage.of(context).controller.index;

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            RouteApp.routemaster.push('/');
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
      body: widget.children[pageIndex],
      bottomNavigationBar: NavigationBottomBar(
        selectedIndex: pageIndex,
        onIndexSelect: onIndexSelect,
      ),
    );
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
