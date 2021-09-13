// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_starter_project/core/app/changenotifier/app_state.dart'
    as _i10;
import 'package:flutter_starter_project/core/dependency_injection/register_module.dart'
    as _i11;
import 'package:flutter_starter_project/feature/posts/bloc/posts_bloc.dart'
    as _i7;
import 'package:flutter_starter_project/feature/posts/repo/posts_repo.dart'
    as _i3;
import 'package:flutter_starter_project/feature/profile/bloc/profile_bloc.dart'
    as _i8;
import 'package:flutter_starter_project/feature/profile/repo/profile_repo.dart'
    as _i4;
import 'package:flutter_starter_project/feature/weather/bloc/weather_bloc.dart'
    as _i9;
import 'package:flutter_starter_project/feature/weather/repo/weather_repo.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.PostsRepo>(() => _i3.PostsRepo());
  gh.factory<_i4.ProfileRepo>(() => _i4.ProfileRepo());
  await gh.factoryAsync<_i5.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.factory<_i6.WeatherRepo>(() => _i6.WeatherRepo());
  gh.factory<_i7.PostsBloc>(() => _i7.PostsBloc(repo: get<_i3.PostsRepo>()));
  gh.factory<_i8.ProfileBloc>(
      () => _i8.ProfileBloc(repo: get<_i4.ProfileRepo>()));
  gh.factory<_i9.WeatherBloc>(
      () => _i9.WeatherBloc(repo: get<_i6.WeatherRepo>()));
  gh.singleton<_i10.AppState>(_i10.AppState());
  return get;
}

class _$RegisterModule extends _i11.RegisterModule {}
