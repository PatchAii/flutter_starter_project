import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_starter_project/feature/ships/bloc/ships_bloc.dart';
import 'package:flutter_starter_project/feature/ships/repo/ships_repo.dart';
import 'package:flutter_starter_project/graphql/ship_query.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/fixture_reader.dart';

class MockShipsRepo extends Mock implements ShipsRepo {}

void main() {
  late ShipsRepo repo;
  SnackBarController.testing = true;

  group('ShipsBloc', () {
    setUp(() {
      repo = MockShipsRepo();
    });

    blocTest<ShipsBloc, ShipsState>(
      'emits [] when nothing is added',
      build: () => _getBloc(repo),
      expect: () => [],
    );

    blocTest<ShipsBloc, ShipsState>(
      'emits [ShipsState.loaded] when fetch is added',
      setUp: () {
        when(() => repo.getShips()).thenAnswer(
          (_) => Future.value([]),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const ShipsEvent.fetch()),
      expect: () => [
        const ShipsState.loading(),
        const ShipsState.loaded(
          ships: [],
        ),
      ],
    );

    blocTest<ShipsBloc, ShipsState>(
      'emits [ShipsState.loaded] when fetch is added with a non empty list',
      setUp: () {
        when(() => repo.getShips()).thenAnswer(
          (_) => Future.value(
            [
              GetShips$Query$Ship.fromJson(
                fixture(
                  'ship.json',
                ),
              ),
              GetShips$Query$Ship.fromJson(
                fixture(
                  'ship.json',
                ),
              ),
              GetShips$Query$Ship.fromJson(
                fixture('ship.json'),
              ),
            ],
          ),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const ShipsEvent.fetch()),
      expect: () => [
        const ShipsState.loading(),
        ShipsState.loaded(
          ships: [
            GetShips$Query$Ship.fromJson(
              fixture(
                'ship.json',
              ),
            ),
            GetShips$Query$Ship.fromJson(
              fixture(
                'ship.json',
              ),
            ),
            GetShips$Query$Ship.fromJson(
              fixture(
                'ship.json',
              ),
            ),
          ],
        ),
      ],
    );

    blocTest<ShipsBloc, ShipsState>(
      'emits [ShipsState.error] when fetch throws an error',
      setUp: () {
        when(() => repo.getShips()).thenAnswer(
          (_) => Future.value(throw Exception()),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const ShipsEvent.fetch()),
      expect: () => [const ShipsState.loading(), const ShipsState.error()],
    );

  });
}

ShipsBloc _getBloc(ShipsRepo repo) => ShipsBloc(repo: repo);
