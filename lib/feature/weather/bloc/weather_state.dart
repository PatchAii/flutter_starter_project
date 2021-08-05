part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.loaded({
    required String city,
    required List<Weather> weathers,
  }) = _Loaded;
  const factory WeatherState.error() = _Error;
}
