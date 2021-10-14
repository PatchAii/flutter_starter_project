part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.error() = _Error;

  const factory ProfileState.loaded({required User user}) = _Loaded;

  const factory ProfileState.loading() = _Loading;
}
