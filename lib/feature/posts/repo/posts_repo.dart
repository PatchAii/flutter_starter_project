import 'dart:convert';

import 'package:flutter_starter_project/model/post/post.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostsRepo {
  PostsRepo({
    required this.restClient,
  });

  final RestClient restClient;

  Future<List<Post>> fetchPosts() async {
    final res = await restClient.get(
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
    final res = await restClient.get(
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
