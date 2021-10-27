part of 'ships_bloc.dart';

@freezed
class ShipsState with _$ShipsState {
  const factory ShipsState.error() = _Error;

  const factory ShipsState.loaded({
    required List<GetShips$Query$Ship?>? ships,
  }) = _Loaded;

  const factory ShipsState.loading() = _Loading;
}
