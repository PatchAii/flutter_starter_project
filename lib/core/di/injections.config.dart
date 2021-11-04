// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_starter_project/core/app/repo/app_state.dart' as _i17;
import 'package:flutter_starter_project/core/di/register_module.dart' as _i19;
import 'package:flutter_starter_project/core/route/route_app.dart' as _i18;
import 'package:flutter_starter_project/feature/pokedex/bloc/pokedex_bloc.dart'
    as _i10;
import 'package:flutter_starter_project/feature/pokedex/repo/pokedex_repo.dart'
    as _i6;
import 'package:flutter_starter_project/feature/posts/bloc/posts_bloc.dart'
    as _i15;
import 'package:flutter_starter_project/feature/posts/repo/posts_repo.dart'
    as _i11;
import 'package:flutter_starter_project/feature/profile/bloc/profile_bloc.dart'
    as _i16;
import 'package:flutter_starter_project/feature/profile/repo/profile_repo.dart'
    as _i12;
import 'package:flutter_starter_project/feature/testfeature/bloc/spacex_bloc.dart'
    as _i14;
import 'package:flutter_starter_project/feature/testfeature/datasources/spacex_data.dart'
    as _i9;
import 'package:flutter_starter_project/feature/testfeature/repo/spacex_repo.dart'
    as _i13;
import 'package:flutter_starter_project/utils/network/graphql_client.dart'
    as _i4;
import 'package:flutter_starter_project/utils/network/graphql_client_spacex.dart'
    as _i5;
import 'package:flutter_starter_project/utils/utils.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Client>(() => registerModule.httpClient);
  gh.factory<_i4.GraphqlClient>(() => registerModule.graphqlClient);
  gh.factory<_i5.GraphqlClientSpacex>(() => registerModule.graphqlClientSpacex);
  gh.factory<_i6.PokedexRepo>(
      () => _i6.PokedexRepo(graphqlClient: get<_i4.GraphqlClient>()));
  gh.factory<_i7.RestClient>(() => registerModule.restClient);
  await gh.factoryAsync<_i8.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<_i9.SpacexData>(
      () => _i9.SpacexDataGraphQL(
          graphqlClientpacex: get<_i5.GraphqlClientSpacex>()),
      instanceName: 'GraphQLData');
  gh.factory<_i10.PokedexBloc>(
      () => _i10.PokedexBloc(repo: get<_i6.PokedexRepo>()));
  gh.factory<_i11.PostsRepo>(
      () => _i11.PostsRepo(restClient: get<_i7.RestClient>()));
  gh.factory<_i12.ProfileRepo>(
      () => _i12.ProfileRepo(restClient: get<_i7.RestClient>()));
  gh.factory<_i13.SpaceXRepo>(() => _i13.SpaceXRepo(
      spacexData: get<_i9.SpacexData>(instanceName: 'GraphQLData')));
  gh.factory<_i14.SpacexBloc>(
      () => _i14.SpacexBloc(spaceXRepo: get<_i13.SpaceXRepo>()));
  gh.factory<_i15.PostsBloc>(() => _i15.PostsBloc(repo: get<_i11.PostsRepo>()));
  gh.factory<_i16.ProfileBloc>(
      () => _i16.ProfileBloc(repo: get<_i12.ProfileRepo>()));
  gh.singleton<_i17.AppState>(_i17.AppState());
  gh.singleton<_i18.NavObserver>(_i18.NavObserver());
  return get;
}

class _$RegisterModule extends _i19.RegisterModule {}
