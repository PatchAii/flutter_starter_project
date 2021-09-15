import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/common/widget/app_loading.dart';
import 'package:flutter_starter_project/feature/pokedex/bloc/pokedex_bloc.dart';
import 'package:flutter_starter_project/graphql/graphql_operations_api.dart';
import 'package:layout/layout.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PokedexBloc>()
        ..add(
          const PokedexEvent.fetch(),
        ),
      child: Scaffold(
        body: BlocBuilder<PokedexBloc, PokedexState>(
          builder: (context, state) {
            return state.map(
              loading: (state) => const AppLoading(),
              loaded: (state) => PokedexList(
                pokedex: state.pokedex,
              ),
              error: (state) => const PokedexError(),
            );
          },
        ),
      ),
    );
  }
}

class PokedexList extends StatelessWidget {
  const PokedexList({
    Key? key,
    required this.pokedex,
  }) : super(key: key);

  final List<GetPokedex$Query$Pokemon?>? pokedex;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        if (context.layout.breakpoint > LayoutBreakpoint.sm)
          SliverGrid.count(
            crossAxisCount: 4,
            children: [
              for (final pokemon in pokedex!)
                PokemonCardGrid(
                  pokemon: pokemon!,
                ),
            ],
          ),
        if (context.layout.breakpoint <= LayoutBreakpoint.sm)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return PokemonCardList(
                  pokemon: pokedex![index]!,
                );
              },
              childCount: pokedex!.length,
            ),
          )
      ],
    );
  }
}

class PokedexHeader extends StatelessWidget {
  const PokedexHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const Text('Pokedex')],
    );
  }
}

class PokedexError extends StatelessWidget {
  const PokedexError({
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
              context.read<PokedexBloc>().add(
                    const PokedexEvent.fetch(),
                  );
            },
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }
}

class PokemonCardGrid extends StatelessWidget {
  const PokemonCardGrid({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  final GetPokedex$Query$Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              pokemon.name!,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(pokemon.image!),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  pokemon.height!.minimum.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  pokemon.height!.maximum.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  pokemon.weight!.minimum.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  pokemon.weight!.maximum.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  pokemon.maxCP.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  pokemon.maxHP.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonCardList extends StatelessWidget {
  const PokemonCardList({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  final GetPokedex$Query$Pokemon pokemon;
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
                  image: NetworkImage(pokemon.image!),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name!,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        pokemon.height!.minimum.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        pokemon.height!.maximum.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        pokemon.weight!.minimum.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        pokemon.weight!.maximum.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        pokemon.maxCP.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        pokemon.maxHP.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
