import 'dart:convert';

import 'package:flutter_starter_project/feature/posts/repo/posts_repo.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../utils/fixture_reader.dart';

class MockRestClient extends Mock implements RestClient {}

void main() {
  late MockRestClient restClient;
  late PostsRepo repo;
  group('Posts repo', () {
    setUpAll(() {
      restClient = MockRestClient();
      repo = PostsRepo(
        restClient: restClient,
      );
    });

    test('when FetchPosts, return list of Post', () async {
      final p = <Post?>[
        Post.fromJson(
          fixture(
            'post.json',
          ),
        ),
        Post.fromJson(
          fixture(
            'post.json',
          ),
        ),
        Post.fromJson(
          fixture(
            'post.json',
          ),
        ),
      ];

      when(() => restClient.get(
            api: captureAny(named: 'api'),
            endpoint: captureAny(named: 'endpoint'),
          )).thenAnswer(
        (_) => Future.value(http.Response(
          json.encode(
            p,
          ),
          200,
        )),
      );
      final post = await repo.fetchPosts();
      expect(
        post,
        p,
      );
    });

    test('when FetchPostsByUserId, return list of Post', () async {
      final p = <Post?>[
        Post.fromJson(
          fixture(
            'post.json',
          ),
        ),
        Post.fromJson(
          fixture(
            'post.json',
          ),
        ),
        Post.fromJson(
          fixture(
            'post.json',
          ),
        ),
      ];

      when(() => restClient.get(
            api: captureAny(named: 'api'),
            endpoint: captureAny(named: 'endpoint'),
          )).thenAnswer(
        (_) => Future.value(http.Response(
          json.encode(
            p,
          ),
          200,
        )),
      );
      final post = await repo.fetchPostsByUserId('1');
      expect(
        post,
        p,
      );
    });
  });
}
