import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_starter_project/feature/pokedex/bloc/pokedex_bloc.dart';
import 'package:flutter_starter_project/feature/pokedex/repo/pokedex_repo.dart';
import 'package:flutter_starter_project/graphql/graphql_operations_api.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/fixture_reader.dart';

class MockPokedexRepo extends Mock implements PokedexRepo {}

void main() {
  late PokedexRepo repo;
  SnackBarController.testing = true;
  group('PokedexBloc', () {
    setUp(() {
      repo = MockPokedexRepo();
    });

    blocTest<PokedexBloc, PokedexState>(
      'emits [] when nothing is added',
      build: () => _getBloc(repo),
      expect: () => [],
    );

    blocTest<PokedexBloc, PokedexState>(
      'emits [PokedexState.loaded] when fetch is added',
      setUp: () {
        when(() => repo.getPokedex()).thenAnswer(
          (_) => Future.value([]),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const PokedexEvent.fetch()),
      expect: () => [
        const PokedexState.loading(),
        const PokedexState.loaded(
          pokedex: [],
        ),
      ],
    );

    blocTest<PokedexBloc, PokedexState>(
      'emits [PokedexState.loaded] when fetch is added with a non empty list',
      setUp: () {
        when(() => repo.getPokedex()).thenAnswer(
          (_) => Future.value(
            [
              GetPokedex$Query$Pokemon.fromJson(
                fixture(
                  'pokemon.json',
                ),
              ),
              GetPokedex$Query$Pokemon.fromJson(
                fixture(
                  'pokemon.json',
                ),
              ),
              GetPokedex$Query$Pokemon.fromJson(
                fixture('pokemon.json'),
              ),
            ],
          ),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const PokedexEvent.fetch()),
      expect: () => [
        const PokedexState.loading(),
        PokedexState.loaded(
          pokedex: [
            GetPokedex$Query$Pokemon.fromJson(
              fixture(
                'pokemon.json',
              ),
            ),
            GetPokedex$Query$Pokemon.fromJson(
              fixture(
                'pokemon.json',
              ),
            ),
            GetPokedex$Query$Pokemon.fromJson(
              fixture(
                'pokemon.json',
              ),
            ),
          ],
        ),
      ],
    );

    blocTest<PokedexBloc, PokedexState>(
      'emits [PokedexState.error] when fetch throws an error',
      setUp: () {
        when(() => repo.getPokedex()).thenAnswer(
          (_) => Future.value(throw Exception()),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const PokedexEvent.fetch()),
      expect: () => [const PokedexState.loading(), const PokedexState.error()],
    );
  });
}

PokedexBloc _getBloc(PokedexRepo repo) => PokedexBloc(repo: repo);
