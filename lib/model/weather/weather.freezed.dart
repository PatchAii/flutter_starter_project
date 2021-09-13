// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
class _$WeatherTearOff {
  const _$WeatherTearOff();

  _Weather call(
      {required num id,
      @JsonKey(name: 'weather_state_name')
          required String weatherStateName,
      @JsonKey(name: 'weather_state_abbr')
          required WeatherStateAbbr weatherStateAbbr,
      @JsonKey(name: 'wind_direction_compass')
          required String windDirectionCompass,
      required DateTime created,
      @JsonKey(name: 'applicable_date')
          required DateTime applicableDate,
      @JsonKey(name: 'min_temp')
          required num mnumemp,
      @JsonKey(name: 'max_temp')
          required num maxTemp,
      @JsonKey(name: 'the_temp')
          required num theTemp,
      @JsonKey(name: 'wind_speed')
          required num windSpeed,
      @JsonKey(name: 'wind_direction')
          required num windDirection,
      @JsonKey(name: 'air_pressure')
          required num airPressure,
      required num humidity,
      required num visibility,
      required num predictability}) {
    return _Weather(
      id: id,
      weatherStateName: weatherStateName,
      weatherStateAbbr: weatherStateAbbr,
      windDirectionCompass: windDirectionCompass,
      created: created,
      applicableDate: applicableDate,
      mnumemp: mnumemp,
      maxTemp: maxTemp,
      theTemp: theTemp,
      windSpeed: windSpeed,
      windDirection: windDirection,
      airPressure: airPressure,
      humidity: humidity,
      visibility: visibility,
      predictability: predictability,
    );
  }

  Weather fromJson(Map<String, Object> json) {
    return Weather.fromJson(json);
  }
}

/// @nodoc
const $Weather = _$WeatherTearOff();

/// @nodoc
mixin _$Weather {
  num get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather_state_name')
  String get weatherStateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather_state_abbr')
  WeatherStateAbbr get weatherStateAbbr => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_direction_compass')
  String get windDirectionCompass => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  @JsonKey(name: 'applicable_date')
  DateTime get applicableDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_temp')
  num get mnumemp => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_temp')
  num get maxTemp => throw _privateConstructorUsedError;
  @JsonKey(name: 'the_temp')
  num get theTemp => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed')
  num get windSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_direction')
  num get windDirection => throw _privateConstructorUsedError;
  @JsonKey(name: 'air_pressure')
  num get airPressure => throw _privateConstructorUsedError;
  num get humidity => throw _privateConstructorUsedError;
  num get visibility => throw _privateConstructorUsedError;
  num get predictability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res>;
  $Res call(
      {num id,
      @JsonKey(name: 'weather_state_name') String weatherStateName,
      @JsonKey(name: 'weather_state_abbr') WeatherStateAbbr weatherStateAbbr,
      @JsonKey(name: 'wind_direction_compass') String windDirectionCompass,
      DateTime created,
      @JsonKey(name: 'applicable_date') DateTime applicableDate,
      @JsonKey(name: 'min_temp') num mnumemp,
      @JsonKey(name: 'max_temp') num maxTemp,
      @JsonKey(name: 'the_temp') num theTemp,
      @JsonKey(name: 'wind_speed') num windSpeed,
      @JsonKey(name: 'wind_direction') num windDirection,
      @JsonKey(name: 'air_pressure') num airPressure,
      num humidity,
      num visibility,
      num predictability});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  final Weather _value;
  // ignore: unused_field
  final $Res Function(Weather) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? weatherStateName = freezed,
    Object? weatherStateAbbr = freezed,
    Object? windDirectionCompass = freezed,
    Object? created = freezed,
    Object? applicableDate = freezed,
    Object? mnumemp = freezed,
    Object? maxTemp = freezed,
    Object? theTemp = freezed,
    Object? windSpeed = freezed,
    Object? windDirection = freezed,
    Object? airPressure = freezed,
    Object? humidity = freezed,
    Object? visibility = freezed,
    Object? predictability = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      weatherStateName: weatherStateName == freezed
          ? _value.weatherStateName
          : weatherStateName // ignore: cast_nullable_to_non_nullable
              as String,
      weatherStateAbbr: weatherStateAbbr == freezed
          ? _value.weatherStateAbbr
          : weatherStateAbbr // ignore: cast_nullable_to_non_nullable
              as WeatherStateAbbr,
      windDirectionCompass: windDirectionCompass == freezed
          ? _value.windDirectionCompass
          : windDirectionCompass // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applicableDate: applicableDate == freezed
          ? _value.applicableDate
          : applicableDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mnumemp: mnumemp == freezed
          ? _value.mnumemp
          : mnumemp // ignore: cast_nullable_to_non_nullable
              as num,
      maxTemp: maxTemp == freezed
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as num,
      theTemp: theTemp == freezed
          ? _value.theTemp
          : theTemp // ignore: cast_nullable_to_non_nullable
              as num,
      windSpeed: windSpeed == freezed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as num,
      windDirection: windDirection == freezed
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as num,
      airPressure: airPressure == freezed
          ? _value.airPressure
          : airPressure // ignore: cast_nullable_to_non_nullable
              as num,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as num,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as num,
      predictability: predictability == freezed
          ? _value.predictability
          : predictability // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) then) =
      __$WeatherCopyWithImpl<$Res>;
  @override
  $Res call(
      {num id,
      @JsonKey(name: 'weather_state_name') String weatherStateName,
      @JsonKey(name: 'weather_state_abbr') WeatherStateAbbr weatherStateAbbr,
      @JsonKey(name: 'wind_direction_compass') String windDirectionCompass,
      DateTime created,
      @JsonKey(name: 'applicable_date') DateTime applicableDate,
      @JsonKey(name: 'min_temp') num mnumemp,
      @JsonKey(name: 'max_temp') num maxTemp,
      @JsonKey(name: 'the_temp') num theTemp,
      @JsonKey(name: 'wind_speed') num windSpeed,
      @JsonKey(name: 'wind_direction') num windDirection,
      @JsonKey(name: 'air_pressure') num airPressure,
      num humidity,
      num visibility,
      num predictability});
}

/// @nodoc
class __$WeatherCopyWithImpl<$Res> extends _$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(_Weather _value, $Res Function(_Weather) _then)
      : super(_value, (v) => _then(v as _Weather));

  @override
  _Weather get _value => super._value as _Weather;

  @override
  $Res call({
    Object? id = freezed,
    Object? weatherStateName = freezed,
    Object? weatherStateAbbr = freezed,
    Object? windDirectionCompass = freezed,
    Object? created = freezed,
    Object? applicableDate = freezed,
    Object? mnumemp = freezed,
    Object? maxTemp = freezed,
    Object? theTemp = freezed,
    Object? windSpeed = freezed,
    Object? windDirection = freezed,
    Object? airPressure = freezed,
    Object? humidity = freezed,
    Object? visibility = freezed,
    Object? predictability = freezed,
  }) {
    return _then(_Weather(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      weatherStateName: weatherStateName == freezed
          ? _value.weatherStateName
          : weatherStateName // ignore: cast_nullable_to_non_nullable
              as String,
      weatherStateAbbr: weatherStateAbbr == freezed
          ? _value.weatherStateAbbr
          : weatherStateAbbr // ignore: cast_nullable_to_non_nullable
              as WeatherStateAbbr,
      windDirectionCompass: windDirectionCompass == freezed
          ? _value.windDirectionCompass
          : windDirectionCompass // ignore: cast_nullable_to_non_nullable
              as String,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applicableDate: applicableDate == freezed
          ? _value.applicableDate
          : applicableDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mnumemp: mnumemp == freezed
          ? _value.mnumemp
          : mnumemp // ignore: cast_nullable_to_non_nullable
              as num,
      maxTemp: maxTemp == freezed
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as num,
      theTemp: theTemp == freezed
          ? _value.theTemp
          : theTemp // ignore: cast_nullable_to_non_nullable
              as num,
      windSpeed: windSpeed == freezed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as num,
      windDirection: windDirection == freezed
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as num,
      airPressure: airPressure == freezed
          ? _value.airPressure
          : airPressure // ignore: cast_nullable_to_non_nullable
              as num,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as num,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as num,
      predictability: predictability == freezed
          ? _value.predictability
          : predictability // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Weather implements _Weather {
  const _$_Weather(
      {required this.id,
      @JsonKey(name: 'weather_state_name')
          required this.weatherStateName,
      @JsonKey(name: 'weather_state_abbr')
          required this.weatherStateAbbr,
      @JsonKey(name: 'wind_direction_compass')
          required this.windDirectionCompass,
      required this.created,
      @JsonKey(name: 'applicable_date')
          required this.applicableDate,
      @JsonKey(name: 'min_temp')
          required this.mnumemp,
      @JsonKey(name: 'max_temp')
          required this.maxTemp,
      @JsonKey(name: 'the_temp')
          required this.theTemp,
      @JsonKey(name: 'wind_speed')
          required this.windSpeed,
      @JsonKey(name: 'wind_direction')
          required this.windDirection,
      @JsonKey(name: 'air_pressure')
          required this.airPressure,
      required this.humidity,
      required this.visibility,
      required this.predictability});

  factory _$_Weather.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherFromJson(json);

  @override
  final num id;
  @override
  @JsonKey(name: 'weather_state_name')
  final String weatherStateName;
  @override
  @JsonKey(name: 'weather_state_abbr')
  final WeatherStateAbbr weatherStateAbbr;
  @override
  @JsonKey(name: 'wind_direction_compass')
  final String windDirectionCompass;
  @override
  final DateTime created;
  @override
  @JsonKey(name: 'applicable_date')
  final DateTime applicableDate;
  @override
  @JsonKey(name: 'min_temp')
  final num mnumemp;
  @override
  @JsonKey(name: 'max_temp')
  final num maxTemp;
  @override
  @JsonKey(name: 'the_temp')
  final num theTemp;
  @override
  @JsonKey(name: 'wind_speed')
  final num windSpeed;
  @override
  @JsonKey(name: 'wind_direction')
  final num windDirection;
  @override
  @JsonKey(name: 'air_pressure')
  final num airPressure;
  @override
  final num humidity;
  @override
  final num visibility;
  @override
  final num predictability;

  @override
  String toString() {
    return 'Weather(id: $id, weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, windDirectionCompass: $windDirectionCompass, created: $created, applicableDate: $applicableDate, mnumemp: $mnumemp, maxTemp: $maxTemp, theTemp: $theTemp, windSpeed: $windSpeed, windDirection: $windDirection, airPressure: $airPressure, humidity: $humidity, visibility: $visibility, predictability: $predictability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Weather &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.weatherStateName, weatherStateName) ||
                const DeepCollectionEquality()
                    .equals(other.weatherStateName, weatherStateName)) &&
            (identical(other.weatherStateAbbr, weatherStateAbbr) ||
                const DeepCollectionEquality()
                    .equals(other.weatherStateAbbr, weatherStateAbbr)) &&
            (identical(other.windDirectionCompass, windDirectionCompass) ||
                const DeepCollectionEquality().equals(
                    other.windDirectionCompass, windDirectionCompass)) &&
            (identical(other.created, created) ||
                const DeepCollectionEquality()
                    .equals(other.created, created)) &&
            (identical(other.applicableDate, applicableDate) ||
                const DeepCollectionEquality()
                    .equals(other.applicableDate, applicableDate)) &&
            (identical(other.mnumemp, mnumemp) ||
                const DeepCollectionEquality()
                    .equals(other.mnumemp, mnumemp)) &&
            (identical(other.maxTemp, maxTemp) ||
                const DeepCollectionEquality()
                    .equals(other.maxTemp, maxTemp)) &&
            (identical(other.theTemp, theTemp) ||
                const DeepCollectionEquality()
                    .equals(other.theTemp, theTemp)) &&
            (identical(other.windSpeed, windSpeed) ||
                const DeepCollectionEquality()
                    .equals(other.windSpeed, windSpeed)) &&
            (identical(other.windDirection, windDirection) ||
                const DeepCollectionEquality()
                    .equals(other.windDirection, windDirection)) &&
            (identical(other.airPressure, airPressure) ||
                const DeepCollectionEquality()
                    .equals(other.airPressure, airPressure)) &&
            (identical(other.humidity, humidity) ||
                const DeepCollectionEquality()
                    .equals(other.humidity, humidity)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.predictability, predictability) ||
                const DeepCollectionEquality()
                    .equals(other.predictability, predictability)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(weatherStateName) ^
      const DeepCollectionEquality().hash(weatherStateAbbr) ^
      const DeepCollectionEquality().hash(windDirectionCompass) ^
      const DeepCollectionEquality().hash(created) ^
      const DeepCollectionEquality().hash(applicableDate) ^
      const DeepCollectionEquality().hash(mnumemp) ^
      const DeepCollectionEquality().hash(maxTemp) ^
      const DeepCollectionEquality().hash(theTemp) ^
      const DeepCollectionEquality().hash(windSpeed) ^
      const DeepCollectionEquality().hash(windDirection) ^
      const DeepCollectionEquality().hash(airPressure) ^
      const DeepCollectionEquality().hash(humidity) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(predictability);

  @JsonKey(ignore: true)
  @override
  _$WeatherCopyWith<_Weather> get copyWith =>
      __$WeatherCopyWithImpl<_Weather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherToJson(this);
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required num id,
      @JsonKey(name: 'weather_state_name')
          required String weatherStateName,
      @JsonKey(name: 'weather_state_abbr')
          required WeatherStateAbbr weatherStateAbbr,
      @JsonKey(name: 'wind_direction_compass')
          required String windDirectionCompass,
      required DateTime created,
      @JsonKey(name: 'applicable_date')
          required DateTime applicableDate,
      @JsonKey(name: 'min_temp')
          required num mnumemp,
      @JsonKey(name: 'max_temp')
          required num maxTemp,
      @JsonKey(name: 'the_temp')
          required num theTemp,
      @JsonKey(name: 'wind_speed')
          required num windSpeed,
      @JsonKey(name: 'wind_direction')
          required num windDirection,
      @JsonKey(name: 'air_pressure')
          required num airPressure,
      required num humidity,
      required num visibility,
      required num predictability}) = _$_Weather;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$_Weather.fromJson;

  @override
  num get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'weather_state_name')
  String get weatherStateName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'weather_state_abbr')
  WeatherStateAbbr get weatherStateAbbr => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'wind_direction_compass')
  String get windDirectionCompass => throw _privateConstructorUsedError;
  @override
  DateTime get created => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'applicable_date')
  DateTime get applicableDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'min_temp')
  num get mnumemp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'max_temp')
  num get maxTemp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'the_temp')
  num get theTemp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'wind_speed')
  num get windSpeed => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'wind_direction')
  num get windDirection => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'air_pressure')
  num get airPressure => throw _privateConstructorUsedError;
  @override
  num get humidity => throw _privateConstructorUsedError;
  @override
  num get visibility => throw _privateConstructorUsedError;
  @override
  num get predictability => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WeatherCopyWith<_Weather> get copyWith =>
      throw _privateConstructorUsedError;
}

City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
class _$CityTearOff {
  const _$CityTearOff();

  _City call(
      {String? title,
      @JsonKey(name: 'location_type') String? locationType,
      num? woeid,
      @JsonKey(name: 'latt_long') String? lattLong}) {
    return _City(
      title: title,
      locationType: locationType,
      woeid: woeid,
      lattLong: lattLong,
    );
  }

  City fromJson(Map<String, Object> json) {
    return City.fromJson(json);
  }
}

/// @nodoc
const $City = _$CityTearOff();

/// @nodoc
mixin _$City {
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_type')
  String? get locationType => throw _privateConstructorUsedError;
  num? get woeid => throw _privateConstructorUsedError;
  @JsonKey(name: 'latt_long')
  String? get lattLong => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityCopyWith<City> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res>;
  $Res call(
      {String? title,
      @JsonKey(name: 'location_type') String? locationType,
      num? woeid,
      @JsonKey(name: 'latt_long') String? lattLong});
}

/// @nodoc
class _$CityCopyWithImpl<$Res> implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._value, this._then);

  final City _value;
  // ignore: unused_field
  final $Res Function(City) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? locationType = freezed,
    Object? woeid = freezed,
    Object? lattLong = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      locationType: locationType == freezed
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
      woeid: woeid == freezed
          ? _value.woeid
          : woeid // ignore: cast_nullable_to_non_nullable
              as num?,
      lattLong: lattLong == freezed
          ? _value.lattLong
          : lattLong // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$CityCopyWith(_City value, $Res Function(_City) then) =
      __$CityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? title,
      @JsonKey(name: 'location_type') String? locationType,
      num? woeid,
      @JsonKey(name: 'latt_long') String? lattLong});
}

/// @nodoc
class __$CityCopyWithImpl<$Res> extends _$CityCopyWithImpl<$Res>
    implements _$CityCopyWith<$Res> {
  __$CityCopyWithImpl(_City _value, $Res Function(_City) _then)
      : super(_value, (v) => _then(v as _City));

  @override
  _City get _value => super._value as _City;

  @override
  $Res call({
    Object? title = freezed,
    Object? locationType = freezed,
    Object? woeid = freezed,
    Object? lattLong = freezed,
  }) {
    return _then(_City(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      locationType: locationType == freezed
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
      woeid: woeid == freezed
          ? _value.woeid
          : woeid // ignore: cast_nullable_to_non_nullable
              as num?,
      lattLong: lattLong == freezed
          ? _value.lattLong
          : lattLong // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_City implements _City {
  const _$_City(
      {this.title,
      @JsonKey(name: 'location_type') this.locationType,
      this.woeid,
      @JsonKey(name: 'latt_long') this.lattLong});

  factory _$_City.fromJson(Map<String, dynamic> json) =>
      _$_$_CityFromJson(json);

  @override
  final String? title;
  @override
  @JsonKey(name: 'location_type')
  final String? locationType;
  @override
  final num? woeid;
  @override
  @JsonKey(name: 'latt_long')
  final String? lattLong;

  @override
  String toString() {
    return 'City(title: $title, locationType: $locationType, woeid: $woeid, lattLong: $lattLong)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _City &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.locationType, locationType) ||
                const DeepCollectionEquality()
                    .equals(other.locationType, locationType)) &&
            (identical(other.woeid, woeid) ||
                const DeepCollectionEquality().equals(other.woeid, woeid)) &&
            (identical(other.lattLong, lattLong) ||
                const DeepCollectionEquality()
                    .equals(other.lattLong, lattLong)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(locationType) ^
      const DeepCollectionEquality().hash(woeid) ^
      const DeepCollectionEquality().hash(lattLong);

  @JsonKey(ignore: true)
  @override
  _$CityCopyWith<_City> get copyWith =>
      __$CityCopyWithImpl<_City>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CityToJson(this);
  }
}

abstract class _City implements City {
  const factory _City(
      {String? title,
      @JsonKey(name: 'location_type') String? locationType,
      num? woeid,
      @JsonKey(name: 'latt_long') String? lattLong}) = _$_City;

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'location_type')
  String? get locationType => throw _privateConstructorUsedError;
  @override
  num? get woeid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'latt_long')
  String? get lattLong => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CityCopyWith<_City> get copyWith => throw _privateConstructorUsedError;
}
