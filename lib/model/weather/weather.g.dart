// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$_$_WeatherFromJson(Map<String, dynamic> json) {
  return _$_Weather(
    id: json['id'] as num,
    weatherStateName: json['weather_state_name'] as String,
    weatherStateAbbr:
        _$enumDecode(_$WeatherStateAbbrEnumMap, json['weather_state_abbr']),
    windDirectionCompass: json['wind_direction_compass'] as String,
    created: DateTime.parse(json['created'] as String),
    applicableDate: DateTime.parse(json['applicable_date'] as String),
    mnumemp: json['min_temp'] as num,
    maxTemp: json['max_temp'] as num,
    theTemp: json['the_temp'] as num,
    windSpeed: json['wind_speed'] as num,
    windDirection: json['wind_direction'] as num,
    airPressure: json['air_pressure'] as num,
    humidity: json['humidity'] as num,
    visibility: json['visibility'] as num,
    predictability: json['predictability'] as num,
  );
}

Map<String, dynamic> _$_$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr':
          _$WeatherStateAbbrEnumMap[instance.weatherStateAbbr],
      'wind_direction_compass': instance.windDirectionCompass,
      'created': instance.created.toIso8601String(),
      'applicable_date': instance.applicableDate.toIso8601String(),
      'min_temp': instance.mnumemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$WeatherStateAbbrEnumMap = {
  WeatherStateAbbr.sn: 'sn',
  WeatherStateAbbr.sl: 'sl',
  WeatherStateAbbr.h: 'h',
  WeatherStateAbbr.t: 't',
  WeatherStateAbbr.hr: 'hr',
  WeatherStateAbbr.lr: 'lr',
  WeatherStateAbbr.s: 's',
  WeatherStateAbbr.hc: 'hc',
  WeatherStateAbbr.lc: 'lc',
  WeatherStateAbbr.c: 'c',
};

_$_City _$_$_CityFromJson(Map<String, dynamic> json) {
  return _$_City(
    title: json['title'] as String?,
    locationType: json['location_type'] as String?,
    woeid: json['woeid'] as num?,
    lattLong: json['latt_long'] as String?,
  );
}

Map<String, dynamic> _$_$_CityToJson(_$_City instance) => <String, dynamic>{
      'title': instance.title,
      'location_type': instance.locationType,
      'woeid': instance.woeid,
      'latt_long': instance.lattLong,
    };
