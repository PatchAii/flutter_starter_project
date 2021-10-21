import 'dart:convert';

import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/model/post/post.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostsRepo {
  Future<Post> fetchPost(int postId) async {
    final res = await getIt<RestClient>().get(
      api: 'posts/$postId',
      endpoint: 'https://jsonplaceholder.typicode.com/',
    );

    final post = Post.fromJson(jsonDecode(res.body));

    return post;
  }

  Future<List<Post>> fetchPosts() async {
    final res = await getIt<RestClient>().get(
      api: 'posts',
      endpoint: 'https://jsonplaceholder.typicode.com/',
    );
    final List<dynamic> decodedJson = jsonDecode(res.body);
    final posts = List<Post>.from(
      decodedJson.map(
        (json) {
          return Post.fromJson(json);
        },
      ),
    );

    return posts;
  }

  Future<List<Post>> fetchPostsByUserId(String userId) async {
    final res = await getIt<RestClient>().get(
      api: 'posts/?userId=$userId',
      endpoint: 'https://jsonplaceholder.typicode.com/',
    );
    final List<dynamic> decodedJson = jsonDecode(res.body);
    final posts = List<Post>.from(
      decodedJson.map(
        (json) {
          return Post.fromJson(json);
        },
      ),
    );

    return posts;
  }
}
