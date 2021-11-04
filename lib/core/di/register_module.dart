import 'package:flutter_starter_project/utils/network/graphql_client.dart';
import 'package:flutter_starter_project/utils/network/graphql_client_spacex.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  Client get httpClient => Client();

  RestClient get restClient => RestClient(httpClient: httpClient);

  GraphqlClient get graphqlClient => GraphqlClient();
  
  GraphqlClientSpacex get graphqlClientSpacex => GraphqlClientSpacex();
}
