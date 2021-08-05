import 'package:flutter_starter_project/model/weather/weather.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test Weather model', () {
    final w = Weather.fromJson({
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
    });
    expect(w.toJson(), {
      'id': 4701509490049024,
      'weather_state_name': 'Heavy Rain',
      'weather_state_abbr': 'hr',
      'wind_direction_compass': 'S',
      'created': '2021-08-05T09:56:01.775321Z',
      'applicable_date': '2021-08-05T00:00:00.000',
      'min_temp': 13.35,
      'max_temp': 21.005000000000003,
      'the_temp': 20.384999999999998,
      'wind_speed': 8.604628544579656,
      'wind_direction': 182.66568781397157,
      'air_pressure': 1005.5,
      'humidity': 63,
      'visibility': 10.833606736657918,
      'predictability': 77
    });
  });
}
