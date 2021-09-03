import 'package:flutter_starter_project/model/model.dart';
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

  test('Test City model', () {
    final c = City.fromJson({
      'title': 'London',
      'location_type': 'City',
      'woeid': 44418,
      'latt_long': '51.506321,-0.12714'
    });
    expect(c.toJson(), {
      'title': 'London',
      'location_type': 'City',
      'woeid': 44418,
      'latt_long': '51.506321,-0.12714'
    });
  });

  test('Test User model', () {
    final u = User.fromJson({
      'id': 1,
      'name': 'Leanne Graham',
      'username': 'Bret',
      'email': 'Sincere@april.biz',
      'phone': '1-770-736-8031 x56442',
      'website': 'hildegard.org'
    });
    expect(u.toJson(), {
      'id': 1,
      'name': 'Leanne Graham',
      'username': 'Bret',
      'email': 'Sincere@april.biz',
      'address': null,
      'phone': '1-770-736-8031 x56442',
      'website': 'hildegard.org',
      'company': null
    });
  });

  test('Test Company model', () {
    final c = Company.fromJson({
      'name': 'Romaguera-Crona',
      'catchPhrase': 'Multi-layered client-server neural-net',
      'bs': 'harness real-time e-markets'
    });
    expect(c.toJson(), {
      'name': 'Romaguera-Crona',
      'catchPhrase': 'Multi-layered client-server neural-net',
      'bs': 'harness real-time e-markets'
    });
  });

  test('Test Address model', () {
    final a = Address.fromJson({
      'street': 'Kulas Light',
      'suite': 'Apt. 556',
      'city': 'Gwenborough',
      'zipcode': '92998-3874',
      'geo': null
    });
    expect(a.toJson(), {
      'street': 'Kulas Light',
      'suite': 'Apt. 556',
      'city': 'Gwenborough',
      'zipcode': '92998-3874',
      'geo': null
    });
  });

  test('Test Geo model', () {
    final g = Geo.fromJson({'lat': '-37.3159', 'lng': '81.1496'});
    expect(g.toJson(), {'lat': '-37.3159', 'lng': '81.1496'});
  });
}
