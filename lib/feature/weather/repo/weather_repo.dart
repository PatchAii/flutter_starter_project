import 'dart:convert';

import 'package:flutter_starter_project/model/weather/weather.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:injectable/injectable.dart';

@injectable
class WeatherRepo {
  Future<List<Weather>> fetchWeather() async {
    final woeids =
        await RestClient.get(api: '/api/location/search/?query=london');

    final cities = List<City>.from(
      jsonDecode(woeids.body).map(
        (json) {
          return City.fromJson(json);
        },
      ),
    );

    final res =
        await RestClient.get(api: '/api/location/${cities.first.woeid}');
    final weathers = List<Weather>.from(
      jsonDecode(res.body)['consolidated_weather'].map(
        (json) {
          return Weather.fromJson(json);
        },
      ),
    );
    return weathers;
  }
}
