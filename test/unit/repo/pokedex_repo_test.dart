import 'package:artemis/artemis.dart';
import 'package:flutter_starter_project/feature/pokedex/repo/pokedex_repo.dart';
import 'package:flutter_starter_project/graphql/graphql_operations_api.dart';
import 'package:flutter_starter_project/utils/network/graphql_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/fixture_reader.dart';

class MockGraphqlClient extends Mock implements GraphqlClient {}

class GraphQLQueryGetPokedexFake extends Fake
    implements GraphQLQuery<GetPokedex$Query, GetPokedex$Query> {}

void main() {
  late GraphqlClient graphqlClient;
  late PokedexRepo repo;
  group('Pokedex repo', () {
    setUpAll(() {
      registerFallbackValue(GraphQLQueryGetPokedexFake());

      graphqlClient = MockGraphqlClient();
      repo = PokedexRepo(
        graphqlClient: graphqlClient,
      );
    });

    test('when getPokedex, return Pokedex', () async {
      final p = <GetPokedex$Query$Pokemon?>[
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
      ];

      when(() => graphqlClient.exec<GetPokedex$Query, GetPokedex$Query>(
            query: captureAny(named: 'query'),
            endpoint: captureAny(named: 'endpoint'),
          )).thenAnswer(
        (_) {
          final x = GetPokedex$Query()
            ..pokemons = [
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
            ];

          return Future.value(
            GraphQLResponse<GetPokedex$Query>(
              data: x,
            ),
          );
        },
      );
      final pokedex = await repo.getPokedex();

      expect(
        pokedex,
        p,
      );
    });
  });
}
