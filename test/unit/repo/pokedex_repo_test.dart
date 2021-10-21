import 'dart:convert';

import 'package:artemis/schema/graphql_response.dart';
import 'package:flutter_starter_project/feature/pokedex/repo/pokedex_repo.dart';
import 'package:flutter_starter_project/feature/profile/repo/profile_repo.dart';
import 'package:flutter_starter_project/graphql/graphql_operations_api.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_starter_project/utils/network/graphql_client.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../utils/fixture_reader.dart';

class MockGraphqlClient extends Mock implements GraphqlClient {}

void main() {
  late GraphqlClient graphqlClient;
  late PokedexRepo repo;
  group('Pokedex repo', () {
    setUpAll(() {
      graphqlClient = MockGraphqlClient();
      repo = PokedexRepo(
        graphqlClient: graphqlClient,
      );
    });

    test('when getPokedex, return Pokedex', () async {
      final p = fixture(
        'pokedex.json',
      );
      when(() => graphqlClient.exec<List<GetPokedex$Query$Pokemon?>?, U extends JsonSerializable>(
            query: captureAny(named: 'query'),
            endpoint: captureAny(named: 'endpoint'),
          )).thenAnswer(
        (_) => Future.value(GraphQLResponse<List<GetPokedex$Query$Pokemon?>?>),
      );
      final user = await repo.fetchUser();
      expect(
        user,
        User.fromJson(
          u,
        ),
      );
    });

  });
}
