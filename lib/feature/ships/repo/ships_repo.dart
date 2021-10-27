import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter_project/graphql/ship_query.graphql.dart';
import 'package:flutter_starter_project/utils/network/graphql_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShipsRepo {
  Future<List<GetShips$Query$Ship?>?> getShips() async {
    final res = await GraphqlClient.exec(query: GetShipsQuery(), endpoint: dotenv.env['SPACEX_ENDPOINT']);

    return res.data!.ships;
  }
}
