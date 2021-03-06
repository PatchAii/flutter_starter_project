// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_starter_project/core/app/repo/app_state.dart' as _i13;
import 'package:flutter_starter_project/core/di/register_module.dart' as _i15;
import 'package:flutter_starter_project/core/route/route_app.dart' as _i14;
import 'package:flutter_starter_project/feature/pokedex/bloc/pokedex_bloc.dart'
    as _i8;
import 'package:flutter_starter_project/feature/pokedex/repo/pokedex_repo.dart'
    as _i5;
import 'package:flutter_starter_project/feature/posts/bloc/posts_bloc.dart'
    as _i11;
import 'package:flutter_starter_project/feature/posts/repo/posts_repo.dart'
    as _i9;
import 'package:flutter_starter_project/feature/profile/bloc/profile_bloc.dart'
    as _i12;
import 'package:flutter_starter_project/feature/profile/repo/profile_repo.dart'
    as _i10;
import 'package:flutter_starter_project/utils/network/graphql_client.dart'
    as _i4;
import 'package:flutter_starter_project/utils/utils.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Client>(() => registerModule.httpClient);
  gh.factory<_i4.GraphqlClient>(() => registerModule.graphqlClient);
  gh.factory<_i5.PokedexRepo>(
      () => _i5.PokedexRepo(graphqlClient: get<_i4.GraphqlClient>()));
  gh.factory<_i6.RestClient>(() => registerModule.restClient);
  await gh.factoryAsync<_i7.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<_i8.PokedexBloc>(
      () => _i8.PokedexBloc(repo: get<_i5.PokedexRepo>()));
  gh.factory<_i9.PostsRepo>(
      () => _i9.PostsRepo(restClient: get<_i6.RestClient>()));
  gh.factory<_i10.ProfileRepo>(
      () => _i10.ProfileRepo(restClient: get<_i6.RestClient>()));
  gh.factory<_i11.PostsBloc>(() => _i11.PostsBloc(repo: get<_i9.PostsRepo>()));
  gh.factory<_i12.ProfileBloc>(
      () => _i12.ProfileBloc(repo: get<_i10.ProfileRepo>()));
  gh.singleton<_i13.AppState>(_i13.AppState());
  gh.singleton<_i14.NavObserver>(_i14.NavObserver());
  return get;
}

class _$RegisterModule extends _i15.RegisterModule {}
