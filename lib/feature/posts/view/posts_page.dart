import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/common/app_loading.dart';
import 'package:flutter_starter_project/feature/posts/bloc/posts_bloc.dart';
import 'package:flutter_starter_project/model/model.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({
    Key? key,
    this.userId,
  }) : super(key: key);

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PostsBloc>()
        ..add(
          userId != null
              ? PostsEvent.fetchByUserId(userId!)
              : const PostsEvent.fetch(),
        ),
      child: Scaffold(
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            return state.map(
              loading: (state) => const AppLoading(),
              loaded: (state) => PostsList(
                posts: state.posts,
              ),
              error: (state) => const PostsError(),
            );
          },
        ),
      ),
    );
  }
}

class PostsList extends StatelessWidget {
  const PostsList({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 150.0,
          floating: true,
          snap: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Posts',
              style: Theme.of(context).textTheme.headline4!,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final post = posts[index];
              return PostCard(post: post);
            },
            childCount: posts.length,
          ),
        )
      ],
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RouteApp.routemaster.push(
            '/dialog?title=${post.title}&subtitle=${post.id}&description=${post.body}');
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  post.userId.toString(),
                ),
              ),
              title: Text(post.title),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                post.body,
              ),
            ),
            const Divider(),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.share,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PostsError extends StatelessWidget {
  const PostsError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.error.tr(),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<PostsBloc>().add(
                    const PostsEvent.fetch(),
                  );
            },
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }
}
