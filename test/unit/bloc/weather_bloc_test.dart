import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_starter_project/feature/weather/bloc/weather_bloc.dart';
import 'package:flutter_starter_project/feature/weather/repo/weather_repo.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/fixture_reader.dart';

class MockWeatherRepo extends Mock implements WeatherRepo {}

void main() {
  late WeatherRepo repo;
  SnackBarController.testing = true;
  group('WeatherBloc', () {
    setUp(() {
      repo = MockWeatherRepo();
    });

    blocTest<WeatherBloc, WeatherState>(
      'emits [] when nothing is added',
      build: () => _getBloc(repo),
      expect: () => [],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherState.loaded] when fetch is added',
      setUp: () {
        when(() => repo.fetchWeather()).thenAnswer(
          (_) => Future.value([]),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const WeatherEvent.fetch()),
      expect: () => [
        const WeatherState.loading(),
        const WeatherState.loaded(city: 'London', weathers: [])
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherState.loaded] when fetch is added with a non empty list',
      setUp: () {
        when(() => repo.fetchWeather()).thenAnswer(
          (_) => Future.value([
            Weather.fromJson(fixture('weather.json')),
            Weather.fromJson(fixture('weather.json')),
            Weather.fromJson(fixture('weather.json'))
          ]),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const WeatherEvent.fetch()),
      expect: () => [
        const WeatherState.loading(),
        WeatherState.loaded(city: 'London', weathers: [
          Weather.fromJson(fixture('weather.json')),
          Weather.fromJson(fixture('weather.json')),
          Weather.fromJson(fixture('weather.json'))
        ])
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherState.error] when fetch throws an error',
      setUp: () {
        when(() => repo.fetchWeather()).thenAnswer(
          (_) => Future.value(throw Exception()),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const WeatherEvent.fetch()),
      expect: () => [const WeatherState.loading(), const WeatherState.error()],
    );
  });
}

WeatherBloc _getBloc(WeatherRepo repo) => WeatherBloc(repo: repo);
