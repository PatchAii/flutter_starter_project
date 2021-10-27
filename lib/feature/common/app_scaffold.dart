import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/common/top_bar.dart';
import 'package:layout/layout.dart';
import 'package:routemaster/routemaster.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    Key? key,
  }) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  bool extended = true;

  @override
  Widget build(BuildContext context) {
    final pageIndex = TabPage.of(context).controller.index;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: TopBar(
          label: 'patchai',
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                getIt<AppState>().logOut();
              },
            ),
          ],
        ),
        body: Row(
          children: [
            if (context.layout.breakpoint > LayoutBreakpoint.sm) ...[
              NavigationSideBar(
                selectedIndex: pageIndex,
                onIndexSelect: _onIndexSelect,
                extended: extended,
              ),
              const VerticalDivider(thickness: 1, width: 1),
            ],
            Expanded(
              child: PageStackNavigator(
                key: ValueKey(pageIndex),
                stack: TabPage.of(context).stacks[pageIndex],
              ),
            ),
          ],
        ),
        bottomNavigationBar: context.layout.breakpoint < LayoutBreakpoint.md
            ? NavigationBottomBar(
                selectedIndex: pageIndex,
                onIndexSelect: _onIndexSelect,
              )
            : null,
      ),
    );
  }

  @override
  void dispose() {
    NotificationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    NotificationController.isNotificationAllowedOrListen();
    super.initState();
  }

  void onExtendedSelect() {
    setState(() {
      extended = !extended;
    });
  }

  Future<void> _onIndexSelect(newIndex) async {
    switch (newIndex) {
      case 0:
        RouteApp.routemaster.push('/pokedex');
        break;
      case 1:
        RouteApp.routemaster.push('/profile');
        break;
      case 2:
        RouteApp.routemaster.push('/posts');
        break;
      case 3:
        RouteApp.routemaster.push('/ships');
        break;
      default:
        RouteApp.routemaster.push('/');
    }
  }

  Future<bool> _onWillPop() async {
    final pageIndex = TabPage.of(context).controller.index;

    final isHomePage = pageIndex != 0;
    if (isHomePage) {
      setState(() {
        _onIndexSelect(0);
      });
    }

    return !isHomePage;
  }
}

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({
    required this.selectedIndex,
    required this.onIndexSelect,
    Key? key,
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
          label: LocaleKeys.pokedex.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: LocaleKeys.profile.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.list),
          label: LocaleKeys.posts.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.list),
          label: LocaleKeys.ships.tr(),
        ),
      ],
    );
  }
}

class NavigationSideBar extends StatelessWidget {
  const NavigationSideBar({
    required this.selectedIndex,
    required this.onIndexSelect,
    required this.extended,
    Key? key,
  }) : super(key: key);

  final bool extended;
  final Function(int) onIndexSelect;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onIndexSelect,
      labelType: NavigationRailLabelType.none,
      extended: extended,
      destinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.wb_sunny),
          label: Text(LocaleKeys.pokedex.tr()),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.person),
          label: Text(LocaleKeys.profile.tr()),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.list),
          label: Text(LocaleKeys.posts.tr()),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.list),
          label: Text(LocaleKeys.ships.tr()),
        ),
      ],
    );
  }
}
