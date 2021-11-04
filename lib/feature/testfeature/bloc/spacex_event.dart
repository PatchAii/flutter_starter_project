part of 'spacex_bloc.dart';

@freezed
class SpacexEvent with _$SpacexEvent {
  const factory SpacexEvent.search( String name) = _Search;
}