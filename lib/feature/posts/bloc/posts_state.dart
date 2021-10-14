part of 'posts_bloc.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.error() = _Error;

  const factory PostsState.loaded({
    required List<Post> posts,
  }) = _Loaded;

  const factory PostsState.loading() = _Loading;
}
