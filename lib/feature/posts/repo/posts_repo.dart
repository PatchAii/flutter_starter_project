import 'dart:convert';

import 'package:flutter_starter_project/model/post/post.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostsRepo {
  Future<List<Post>> fetchPosts() async {
    final res = await RestClient.get(
      api: 'posts',
      endpoint: 'https://jsonplaceholder.typicode.com/',
    );
    final posts = List<Post>.from(
      jsonDecode(res.body).map(
        (json) {
          return Post.fromJson(json);
        },
      ),
    );
    return posts;
  }

  Future<List<Post>> fetchPostsByUserId(String userId) async {
    final res = await RestClient.get(
      api: 'posts/?userId=$userId',
      endpoint: 'https://jsonplaceholder.typicode.com/',
    );
    final posts = List<Post>.from(
      jsonDecode(res.body).map(
        (json) {
          return Post.fromJson(json);
        },
      ),
    );
    return posts;
  }

  Future<Post> fetchPost(int postId) async {
    final res = await RestClient.get(
      api: 'posts/$postId',
      endpoint: 'https://jsonplaceholder.typicode.com/',
    );

    final post = Post.fromJson(jsonDecode(res.body));
    return post;
  }
}
