import 'package:flutter_starter_project/feature/testfeature/datasources/spacex_data.dart';
import 'package:flutter_starter_project/feature/testfeature/models/launch.dart';
import 'package:injectable/injectable.dart';

@injectable
class SpaceXRepo{
  SpaceXRepo({ @Named('GraphQLData') required this.spacexData});
  final SpacexData spacexData;

  Future<List<Launch?>?> getLaunches(String name) async{
    
    return spacexData.getLaunches(name);
  }
}