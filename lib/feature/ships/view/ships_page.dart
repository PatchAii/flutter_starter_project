import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/common/app_loading.dart';
import 'package:flutter_starter_project/feature/ships/bloc/ships_bloc.dart';
import 'package:flutter_starter_project/graphql/ship_query.graphql.dart';
import 'package:layout/layout.dart';

class ShipsPage extends StatelessWidget {
  const ShipsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShipsBloc>()
        ..add(
          const ShipsEvent.fetch(),
        ),
      child: Scaffold(
        body: BlocBuilder<ShipsBloc, ShipsState>(
          builder: (context, state) {
            return state.map(
              loading: (state) => const AppLoading(),
              loaded: (state) => ShipsList(ships: state.ships),
              error: (state) => const ShipsError(),
            );
          },
        ),
      ),
    );
  }
}

class ShipsList extends StatelessWidget {
  const ShipsList({
    required this.ships,
    Key? key,
  }) : super(key: key);

  final List<GetShips$Query$Ship?>? ships;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (context.layout.breakpoint > LayoutBreakpoint.sm)
          SliverGrid.count(
            crossAxisCount: 4,
            children: [
              for (final ship in ships!)
                ShipCardGrid(
                  ship: ship!,
                ),
            ],
          ),
        if (context.layout.breakpoint <= LayoutBreakpoint.sm)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ShipCardList(
                  ship: ships![index]!,
                );
              },
              childCount: ships!.length,
            ),
          ),
      ],
    );
  }
}

class ShipsHeader extends StatelessWidget {
  const ShipsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const Text('Ships')],
    );
  }
}

class ShipsError extends StatelessWidget {
  const ShipsError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.error.tr(),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ShipsBloc>().add(
                    const ShipsEvent.fetch(),
                  );
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class ShipCardGrid extends StatelessWidget {
  const ShipCardGrid({
    required this.ship,
    Key? key,
  }) : super(key: key);

  final GetShips$Query$Ship ship;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              ship.name!,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(ship.image!),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class ShipCardList extends StatelessWidget {
  const ShipCardList({
    required this.ship,
    Key? key,
  }) : super(key: key);

  final GetShips$Query$Ship ship;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(ship.image!),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ship.name!,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
