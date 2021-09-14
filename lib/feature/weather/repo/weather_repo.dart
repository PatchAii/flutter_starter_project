import 'dart:math';

import 'package:flutter_starter_project/model/weather/weather.dart';
import 'package:injectable/injectable.dart';

@injectable
class WeatherRepo {
  Future<List<Weather>> fetchWeather() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final list = [];
    for (var i = 0; i < 16; i++) {
      final random = Random().nextInt(WeatherStateName.values.length);
      list.add({
        'id': 5807713113079808,
        'weather_state_name':
            WeatherStateName.values[random].toString().split('.').last,
        'weather_state_abbr':
            WeatherStateAbbr.values[random].toString().split('.').last,
        'wind_direction_compass': 'E',
        'created': DateTime.now().add(Duration(days: i)).toIso8601String(),
        'applicable_date':
            DateTime.now().add(Duration(days: i)).toIso8601String(),
        'min_temp': 15.01,
        'max_temp': 18.555,
        'the_temp': 17.310000000000002,
        'wind_speed': 2.975969828251014,
        'wind_direction': 84.0,
        'air_pressure': 1012.0,
        'humidity': 92,
        'visibility': 5.821626700071581,
        'predictability': 77
      });
    }

    final weathers = List<Weather>.from(
      list.map(
        (json) {
          return Weather.fromJson(json);
        },
      ),
    );
    return weathers;
  }
}
