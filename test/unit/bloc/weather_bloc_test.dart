import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_starter_project/feature/weather/bloc/weather_bloc.dart';
import 'package:flutter_starter_project/feature/weather/repo/weather_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherRepo extends Mock implements WeatherRepo {}

void main() {
  late WeatherRepo repo;

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
