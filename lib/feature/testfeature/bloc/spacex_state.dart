part of 'spacex_bloc.dart';

@freezed
class SpacexState with _$SpacexState {
  const factory SpacexState.error() = _Error;
  const factory SpacexState.loaded({required List<Launch?>? launches}) = _Loaded;
  const factory SpacexState.loading() = _Loading;
  const factory SpacexState.noLaunches() = _NoLaunches;
}
