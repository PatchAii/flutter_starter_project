import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_starter_project/feature/posts/repo/posts_repo.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'posts_event.dart';
part 'posts_state.dart';
part 'posts_bloc.freezed.dart';

@injectable
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required this.repo}) : super(const PostsState.loading());

  final PostsRepo repo;

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    yield* event.map(fetch: _fetch, fetchByUserId: _fetchByUserId);
  }

  Stream<PostsState> _fetch(_Fetch event) async* {
    try {
      yield const PostsState.loading();
      final posts = await repo.fetchPosts();
      yield PostsState.loaded(
        posts: posts,
      );
    } catch (e) {
      yield const PostsState.error();
    }
  }

  Stream<PostsState> _fetchByUserId(_FetchByUserId event) async* {
    try {
      yield const PostsState.loading();
      final posts = await repo.fetchPostsByUserId(event.userId);
      yield PostsState.loaded(
        posts: posts,
      );
    } catch (e) {
      yield const PostsState.error();
    }
  }
}
