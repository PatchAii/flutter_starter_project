import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_starter_project/feature/weather/repo/weather_repo.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.repo,
  }) : super(const WeatherState.loading());

  final WeatherRepo repo;

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield* event.map(
      fetch: _fetch,
    );
  }

  Stream<WeatherState> _fetch(_Fetch event) async* {
    try {
      yield const WeatherState.loading();
      final weathers = await repo.fetchWeather();
      yield WeatherState.loaded(
        city: 'London',
        weathers: weathers,
      );
    } catch (e) {
      SnackBarController.showSnackbar(
        'SnackBar from fetchWeather',
        duration: const Duration(seconds: 10),
      );
      yield const WeatherState.error();
    }
  }
}
