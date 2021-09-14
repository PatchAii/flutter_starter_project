import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required num id,
    @JsonKey(name: 'weather_state_name') required String weatherStateName,
    @JsonKey(name: 'weather_state_abbr')
        required WeatherStateAbbr weatherStateAbbr,
    @JsonKey(name: 'wind_direction_compass')
        required String windDirectionCompass,
    required DateTime created,
    @JsonKey(name: 'applicable_date') required DateTime applicableDate,
    @JsonKey(name: 'min_temp') required num mnumemp,
    @JsonKey(name: 'max_temp') required num maxTemp,
    @JsonKey(name: 'the_temp') required num theTemp,
    @JsonKey(name: 'wind_speed') required num windSpeed,
    @JsonKey(name: 'wind_direction') required num windDirection,
    @JsonKey(name: 'air_pressure') required num airPressure,
    required num humidity,
    required num visibility,
    required num predictability,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    String? title,
    @JsonKey(name: 'location_type') String? locationType,
    num? woeid,
    @JsonKey(name: 'latt_long') String? lattLong,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

enum WeatherStateAbbr {
  sn,
  sl,
  h,
  t,
  hr,
  lr,
  s,
  hc,
  lc,
  c,
}

enum WeatherStateName {
  Snow,
  Sleet,
  Hail,
  Thunderstorm,
  HeavyRain,
  LightRain,
  Showers,
  HeavyCloud,
  LightCloud,
  Clear,
}
