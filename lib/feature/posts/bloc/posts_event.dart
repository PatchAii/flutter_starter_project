part of 'posts_bloc.dart';

@freezed
class PostsEvent with _$PostsEvent {
  const factory PostsEvent.fetch() = _Fetch;
  const factory PostsEvent.fetchByUserId(String userId) = _FetchByUserId;
}
