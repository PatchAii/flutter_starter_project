import 'package:flutter_starter_project/feature/testfeature/models/launch.dart';
import 'package:flutter_starter_project/graphql/graphql_operations_api_SpaceX.dart';
import 'package:flutter_starter_project/utils/network/graphql_client_spacex.dart';
import 'package:injectable/injectable.dart';


abstract class SpacexData{
  Future<List<Launch?>?> getLaunches(String name);
}

@Named('GraphQLData')
@Injectable(as: SpacexData)
class SpacexDataGraphQL implements SpacexData{
  SpacexDataGraphQL({
    required this.graphqlClientpacex,
  });

  final GraphqlClientSpacex graphqlClientpacex;
  @override
  Future<List<Launch?>?> getLaunches(String name) async {
    final res = await graphqlClientpacex.exec(query: GetLaunchesQuery(variables: GetLaunchesArguments(name: name)));
    final launches = res.data!.launches!.map((launch) =>Launch(details: launch?.details,name: launch?.missionName,imageLink: null,) ).toList();

    return launches;
  }
}