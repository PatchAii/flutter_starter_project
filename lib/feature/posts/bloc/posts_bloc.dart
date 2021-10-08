import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_starter_project/feature/posts/repo/posts_repo.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'posts_bloc.freezed.dart';
part 'posts_event.dart';
part 'posts_state.dart';

@injectable
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepo repo;

  PostsBloc({
    required this.repo,
  }) : super(const PostsState.loading()) {
    on<PostsEvent>((event, emit) async {
      await event.map(
        fetch: (event) => _fetch(event, emit),
        fetchByUserId: (event) => _fetchByUserId(event, emit),
      );
    });
  }

  Future _fetch(_Fetch event, Emitter<PostsState> emit) async {
    try {
      emit(const PostsState.loading());
      final posts = await repo.fetchPosts();
      emit(PostsState.loaded(
        posts: posts,
      ));
    } catch (e) {
      emit(const PostsState.error());
    }
  }

  Future _fetchByUserId(_FetchByUserId event, Emitter<PostsState> emit) async {
    try {
      emit(const PostsState.loading());
      final posts = await repo.fetchPostsByUserId(event.userId);
      emit(PostsState.loaded(
        posts: posts,
      ));
    } catch (e) {
      emit(const PostsState.error());
    }
  }
}
