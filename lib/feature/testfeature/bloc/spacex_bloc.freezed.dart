// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'spacex_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SpacexEventTearOff {
  const _$SpacexEventTearOff();

  _Search search(String name) {
    return _Search(
      name,
    );
  }
}

/// @nodoc
const $SpacexEvent = _$SpacexEventTearOff();

/// @nodoc
mixin _$SpacexEvent {
  String get name => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpacexEventCopyWith<SpacexEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpacexEventCopyWith<$Res> {
  factory $SpacexEventCopyWith(
          SpacexEvent value, $Res Function(SpacexEvent) then) =
      _$SpacexEventCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$SpacexEventCopyWithImpl<$Res> implements $SpacexEventCopyWith<$Res> {
  _$SpacexEventCopyWithImpl(this._value, this._then);

  final SpacexEvent _value;
  // ignore: unused_field
  final $Res Function(SpacexEvent) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SearchCopyWith<$Res> implements $SpacexEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) then) =
      __$SearchCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$SearchCopyWithImpl<$Res> extends _$SpacexEventCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(_Search _value, $Res Function(_Search) _then)
      : super(_value, (v) => _then(v as _Search));

  @override
  _Search get _value => super._value as _Search;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_Search(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Search implements _Search {
  const _$_Search(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'SpacexEvent.search(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Search &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$SearchCopyWith<_Search> get copyWith =>
      __$SearchCopyWithImpl<_Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) search,
  }) {
    return search(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements SpacexEvent {
  const factory _Search(String name) = _$_Search;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchCopyWith<_Search> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$SpacexStateTearOff {
  const _$SpacexStateTearOff();

  _Error error() {
    return const _Error();
  }

  _Loaded loaded({required List<Launch?>? launches}) {
    return _Loaded(
      launches: launches,
    );
  }

  _Loading loading() {
    return const _Loading();
  }

  _NoLaunches noLaunches() {
    return const _NoLaunches();
  }
}

/// @nodoc
const $SpacexState = _$SpacexStateTearOff();

/// @nodoc
mixin _$SpacexState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function(List<Launch?>? launches) loaded,
    required TResult Function() loading,
    required TResult Function() noLaunches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function(List<Launch?>? launches)? loaded,
    TResult Function()? loading,
    TResult Function()? noLaunches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoLaunches value) noLaunches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoLaunches value)? noLaunches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpacexStateCopyWith<$Res> {
  factory $SpacexStateCopyWith(
          SpacexState value, $Res Function(SpacexState) then) =
      _$SpacexStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpacexStateCopyWithImpl<$Res> implements $SpacexStateCopyWith<$Res> {
  _$SpacexStateCopyWithImpl(this._value, this._then);

  final SpacexState _value;
  // ignore: unused_field
  final $Res Function(SpacexState) _then;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$SpacexStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'SpacexState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function(List<Launch?>? launches) loaded,
    required TResult Function() loading,
    required TResult Function() noLaunches,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function(List<Launch?>? launches)? loaded,
    TResult Function()? loading,
    TResult Function()? noLaunches,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoLaunches value) noLaunches,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoLaunches value)? noLaunches,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SpacexState {
  const factory _Error() = _$_Error;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({List<Launch?>? launches});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$SpacexStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? launches = freezed,
  }) {
    return _then(_Loaded(
      launches: launches == freezed
          ? _value.launches
          : launches // ignore: cast_nullable_to_non_nullable
              as List<Launch?>?,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required this.launches});

  @override
  final List<Launch?>? launches;

  @override
  String toString() {
    return 'SpacexState.loaded(launches: $launches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.launches, launches) ||
                const DeepCollectionEquality()
                    .equals(other.launches, launches)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(launches);

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function(List<Launch?>? launches) loaded,
    required TResult Function() loading,
    required TResult Function() noLaunches,
  }) {
    return loaded(launches);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function(List<Launch?>? launches)? loaded,
    TResult Function()? loading,
    TResult Function()? noLaunches,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(launches);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoLaunches value) noLaunches,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoLaunches value)? noLaunches,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SpacexState {
  const factory _Loaded({required List<Launch?>? launches}) = _$_Loaded;

  List<Launch?>? get launches => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$SpacexStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'SpacexState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function(List<Launch?>? launches) loaded,
    required TResult Function() loading,
    required TResult Function() noLaunches,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function(List<Launch?>? launches)? loaded,
    TResult Function()? loading,
    TResult Function()? noLaunches,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoLaunches value) noLaunches,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoLaunches value)? noLaunches,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SpacexState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$NoLaunchesCopyWith<$Res> {
  factory _$NoLaunchesCopyWith(
          _NoLaunches value, $Res Function(_NoLaunches) then) =
      __$NoLaunchesCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoLaunchesCopyWithImpl<$Res> extends _$SpacexStateCopyWithImpl<$Res>
    implements _$NoLaunchesCopyWith<$Res> {
  __$NoLaunchesCopyWithImpl(
      _NoLaunches _value, $Res Function(_NoLaunches) _then)
      : super(_value, (v) => _then(v as _NoLaunches));

  @override
  _NoLaunches get _value => super._value as _NoLaunches;
}

/// @nodoc

class _$_NoLaunches implements _NoLaunches {
  const _$_NoLaunches();

  @override
  String toString() {
    return 'SpacexState.noLaunches()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NoLaunches);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() error,
    required TResult Function(List<Launch?>? launches) loaded,
    required TResult Function() loading,
    required TResult Function() noLaunches,
  }) {
    return noLaunches();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? error,
    TResult Function(List<Launch?>? launches)? loaded,
    TResult Function()? loading,
    TResult Function()? noLaunches,
    required TResult orElse(),
  }) {
    if (noLaunches != null) {
      return noLaunches();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Loading value) loading,
    required TResult Function(_NoLaunches value) noLaunches,
  }) {
    return noLaunches(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Loading value)? loading,
    TResult Function(_NoLaunches value)? noLaunches,
    required TResult orElse(),
  }) {
    if (noLaunches != null) {
      return noLaunches(this);
    }
    return orElse();
  }
}

abstract class _NoLaunches implements SpacexState {
  const factory _NoLaunches() = _$_NoLaunches;
}
