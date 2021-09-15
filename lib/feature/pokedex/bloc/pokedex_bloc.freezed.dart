// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pokedex_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PokedexEventTearOff {
  const _$PokedexEventTearOff();

  _Fetch fetch() {
    return const _Fetch();
  }
}

/// @nodoc
const $PokedexEvent = _$PokedexEventTearOff();

/// @nodoc
mixin _$PokedexEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokedexEventCopyWith<$Res> {
  factory $PokedexEventCopyWith(
          PokedexEvent value, $Res Function(PokedexEvent) then) =
      _$PokedexEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PokedexEventCopyWithImpl<$Res> implements $PokedexEventCopyWith<$Res> {
  _$PokedexEventCopyWithImpl(this._value, this._then);

  final PokedexEvent _value;
  // ignore: unused_field
  final $Res Function(PokedexEvent) _then;
}

/// @nodoc
abstract class _$FetchCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) then) =
      __$FetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchCopyWithImpl<$Res> extends _$PokedexEventCopyWithImpl<$Res>
    implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(_Fetch _value, $Res Function(_Fetch) _then)
      : super(_value, (v) => _then(v as _Fetch));

  @override
  _Fetch get _value => super._value as _Fetch;
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch();

  @override
  String toString() {
    return 'PokedexEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PokedexEvent {
  const factory _Fetch() = _$_Fetch;
}

/// @nodoc
class _$PokedexStateTearOff {
  const _$PokedexStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _Loaded loaded({required List<GetPokedex$Query$Pokemon?>? pokedex}) {
    return _Loaded(
      pokedex: pokedex,
    );
  }

  _Error error() {
    return const _Error();
  }
}

/// @nodoc
const $PokedexState = _$PokedexStateTearOff();

/// @nodoc
mixin _$PokedexState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetPokedex$Query$Pokemon?>? pokedex) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetPokedex$Query$Pokemon?>? pokedex)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokedexStateCopyWith<$Res> {
  factory $PokedexStateCopyWith(
          PokedexState value, $Res Function(PokedexState) then) =
      _$PokedexStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PokedexStateCopyWithImpl<$Res> implements $PokedexStateCopyWith<$Res> {
  _$PokedexStateCopyWithImpl(this._value, this._then);

  final PokedexState _value;
  // ignore: unused_field
  final $Res Function(PokedexState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$PokedexStateCopyWithImpl<$Res>
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
    return 'PokedexState.loading()';
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
    required TResult Function() loading,
    required TResult Function(List<GetPokedex$Query$Pokemon?>? pokedex) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetPokedex$Query$Pokemon?>? pokedex)? loaded,
    TResult Function()? error,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PokedexState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({List<GetPokedex$Query$Pokemon?>? pokedex});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$PokedexStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? pokedex = freezed,
  }) {
    return _then(_Loaded(
      pokedex: pokedex == freezed
          ? _value.pokedex
          : pokedex // ignore: cast_nullable_to_non_nullable
              as List<GetPokedex$Query$Pokemon?>?,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required this.pokedex});

  @override
  final List<GetPokedex$Query$Pokemon?>? pokedex;

  @override
  String toString() {
    return 'PokedexState.loaded(pokedex: $pokedex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.pokedex, pokedex) ||
                const DeepCollectionEquality().equals(other.pokedex, pokedex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(pokedex);

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetPokedex$Query$Pokemon?>? pokedex) loaded,
    required TResult Function() error,
  }) {
    return loaded(pokedex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetPokedex$Query$Pokemon?>? pokedex)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pokedex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements PokedexState {
  const factory _Loaded({required List<GetPokedex$Query$Pokemon?>? pokedex}) =
      _$_Loaded;

  List<GetPokedex$Query$Pokemon?>? get pokedex =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$PokedexStateCopyWithImpl<$Res>
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
    return 'PokedexState.error()';
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
    required TResult Function() loading,
    required TResult Function(List<GetPokedex$Query$Pokemon?>? pokedex) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetPokedex$Query$Pokemon?>? pokedex)? loaded,
    TResult Function()? error,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PokedexState {
  const factory _Error() = _$_Error;
}
