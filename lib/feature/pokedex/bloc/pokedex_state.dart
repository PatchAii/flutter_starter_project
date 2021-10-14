part of 'pokedex_bloc.dart';

@freezed
class PokedexState with _$PokedexState {
  const factory PokedexState.error() = _Error;

  const factory PokedexState.loaded({
    required List<GetPokedex$Query$Pokemon?>? pokedex,
  }) = _Loaded;

  const factory PokedexState.loading() = _Loading;
}
