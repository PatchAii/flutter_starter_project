import 'package:flutter_starter_project/graphql/graphql_operations_api.dart';
import 'package:flutter_starter_project/utils/network/graphql_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class PokedexRepo {
  Future<List<GetPokedex$Query$Pokemon?>?> getPokedex() async {
    final res = await GraphqlClient.exec(query: GetPokedexQuery());
    return res.data!.pokemons;
  }
}
