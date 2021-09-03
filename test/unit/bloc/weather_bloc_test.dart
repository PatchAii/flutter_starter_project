import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_starter_project/feature/weather/bloc/weather_bloc.dart';
import 'package:flutter_starter_project/feature/weather/repo/weather_repo.dart';
import 'package:flutter_starter_project/model/model.dart';
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
      'emits [WeatherState.loaded] when fetch is added with a non empty list',
      setUp: () {
        when(() => repo.fetchWeather()).thenAnswer(
          (_) => Future.value([
            Weather.fromJson({
              'id': 4701509490049024,
              'weather_state_name': 'Heavy Rain',
              'weather_state_abbr': 'hr',
              'wind_direction_compass': 'S',
              'created': '2021-08-05T09:56:01.775321Z',
              'applicable_date': '2021-08-05',
              'min_temp': 13.35,
              'max_temp': 21.005000000000003,
              'the_temp': 20.384999999999998,
              'wind_speed': 8.604628544579656,
              'wind_direction': 182.66568781397157,
              'air_pressure': 1005.5,
              'humidity': 63,
              'visibility': 10.833606736657918,
              'predictability': 77
            }),
            Weather.fromJson({
              'id': 4701509490049024,
              'weather_state_name': 'Heavy Rain',
              'weather_state_abbr': 'hr',
              'wind_direction_compass': 'S',
              'created': '2021-08-05T09:56:01.775321Z',
              'applicable_date': '2021-08-05',
              'min_temp': 13.35,
              'max_temp': 21.005000000000003,
              'the_temp': 20.384999999999998,
              'wind_speed': 8.604628544579656,
              'wind_direction': 182.66568781397157,
              'air_pressure': 1005.5,
              'humidity': 63,
              'visibility': 10.833606736657918,
              'predictability': 77
            }),
            Weather.fromJson({
              'id': 4701509490049024,
              'weather_state_name': 'Heavy Rain',
              'weather_state_abbr': 'hr',
              'wind_direction_compass': 'S',
              'created': '2021-08-05T09:56:01.775321Z',
              'applicable_date': '2021-08-05',
              'min_temp': 13.35,
              'max_temp': 21.005000000000003,
              'the_temp': 20.384999999999998,
              'wind_speed': 8.604628544579656,
              'wind_direction': 182.66568781397157,
              'air_pressure': 1005.5,
              'humidity': 63,
              'visibility': 10.833606736657918,
              'predictability': 77
            })
          ]),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const WeatherEvent.fetch()),
      expect: () => [
        const WeatherState.loading(),
        WeatherState.loaded(city: 'London', weathers: [
          Weather.fromJson({
            'id': 4701509490049024,
            'weather_state_name': 'Heavy Rain',
            'weather_state_abbr': 'hr',
            'wind_direction_compass': 'S',
            'created': '2021-08-05T09:56:01.775321Z',
            'applicable_date': '2021-08-05',
            'min_temp': 13.35,
            'max_temp': 21.005000000000003,
            'the_temp': 20.384999999999998,
            'wind_speed': 8.604628544579656,
            'wind_direction': 182.66568781397157,
            'air_pressure': 1005.5,
            'humidity': 63,
            'visibility': 10.833606736657918,
            'predictability': 77
          }),
          Weather.fromJson({
            'id': 4701509490049024,
            'weather_state_name': 'Heavy Rain',
            'weather_state_abbr': 'hr',
            'wind_direction_compass': 'S',
            'created': '2021-08-05T09:56:01.775321Z',
            'applicable_date': '2021-08-05',
            'min_temp': 13.35,
            'max_temp': 21.005000000000003,
            'the_temp': 20.384999999999998,
            'wind_speed': 8.604628544579656,
            'wind_direction': 182.66568781397157,
            'air_pressure': 1005.5,
            'humidity': 63,
            'visibility': 10.833606736657918,
            'predictability': 77
          }),
          Weather.fromJson({
            'id': 4701509490049024,
            'weather_state_name': 'Heavy Rain',
            'weather_state_abbr': 'hr',
            'wind_direction_compass': 'S',
            'created': '2021-08-05T09:56:01.775321Z',
            'applicable_date': '2021-08-05',
            'min_temp': 13.35,
            'max_temp': 21.005000000000003,
            'the_temp': 20.384999999999998,
            'wind_speed': 8.604628544579656,
            'wind_direction': 182.66568781397157,
            'air_pressure': 1005.5,
            'humidity': 63,
            'visibility': 10.833606736657918,
            'predictability': 77
          })
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
