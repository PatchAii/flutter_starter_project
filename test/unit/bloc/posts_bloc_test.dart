import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_starter_project/feature/posts/bloc/posts_bloc.dart';
import 'package:flutter_starter_project/feature/posts/repo/posts_repo.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/fixture_reader.dart';

class MockPostsRepo extends Mock implements PostsRepo {}

void main() {
  late MockPostsRepo repo;
  group('PostsBloc', () {
    setUp(() {
      repo = MockPostsRepo();
    });

    blocTest<PostsBloc, PostsState>(
      'emits [] when nothing is added',
      build: () => _getBloc(repo),
      expect: () => [],
    );

    blocTest<PostsBloc, PostsState>(
      'emits [PostsState.loaded] when fetch is added',
      setUp: () {
        when(() => repo.fetchPosts()).thenAnswer(
          (_) => Future.value([]),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const PostsEvent.fetch()),
      expect: () => [
        const PostsState.loading(),
        const PostsState.loaded(posts: []),
      ],
    );

    blocTest<PostsBloc, PostsState>(
      'emits [PostsState.loaded] when fetch is added with a non empty list',
      setUp: () {
        when(() => repo.fetchPosts()).thenAnswer(
          (_) => Future.value([
            Post.fromJson(fixture('post.json')),
            Post.fromJson(fixture('post.json')),
            Post.fromJson(fixture('post.json'))
          ]),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const PostsEvent.fetch()),
      expect: () => [
        const PostsState.loading(),
        PostsState.loaded(posts: [
          Post.fromJson(fixture('post.json')),
          Post.fromJson(fixture('post.json')),
          Post.fromJson(fixture('post.json'))
        ]),
      ],
    );

    blocTest<PostsBloc, PostsState>(
      'emits [PostsState.loaded] when fetchPostsByUserId',
      setUp: () {
        when(() => repo.fetchPostsByUserId('1')).thenAnswer(
          (_) => Future.value([
            Post.fromJson(fixture('post.json')),
            Post.fromJson(fixture('post.json')),
            Post.fromJson(fixture('post.json'))
          ]),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const PostsEvent.fetchByUserId('1')),
      expect: () => [
        const PostsState.loading(),
        PostsState.loaded(posts: [
          Post.fromJson(fixture('post.json')),
          Post.fromJson(fixture('post.json')),
          Post.fromJson(fixture('post.json'))
        ]),
      ],
    );

    blocTest<PostsBloc, PostsState>(
      'emits [PostsState.error] when fetchPostsByUserId throws an error',
      setUp: () {
        when(() => repo.fetchPostsByUserId('1')).thenAnswer(
          (_) => Future.value(throw Exception()),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const PostsEvent.fetchByUserId('1')),
      expect: () => [
        const PostsState.loading(),
        const PostsState.error(),
      ],
    );

    blocTest<PostsBloc, PostsState>(
      'emits [PostState.error] when fetch throws an error',
      setUp: () {
        when(() => repo.fetchPosts()).thenAnswer(
          (_) => Future.value(throw Exception()),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const PostsEvent.fetch()),
      expect: () => [
        const PostsState.loading(),
        const PostsState.error(),
      ],
    );
  });
}

PostsBloc _getBloc(MockPostsRepo repo) {
  return PostsBloc(repo: repo);
}
