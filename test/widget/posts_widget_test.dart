import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/posts/view/posts_page.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../utils/fixture_reader.dart';
import '../utils/widget_builder.dart';

Future<void> main() async {
  EasyLocalization.logger.enableBuildModes = [];
  await loadAppFonts();
  group('PostsView', () {
    testGoldens('PostsError', (tester) async {
      final builder = getDefaultBuilder(
        const PostsError(),
      );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'posts_error');
    });

    testGoldens('PostCard', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = getDefaultBuilder(
          PostCard(
            post: Post.fromJson(fixture('post.json')),
          ),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'post_card');
      });
    });

    testGoldens('Posts list', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = getDefaultBuilder(
          PostsList(
            posts: [
              Post.fromJson(fixture('post.json')),
              Post.fromJson(fixture('post.json')),
              Post.fromJson(fixture('post.json'))
            ],
          ),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'posts_list');
      });
    });
  });
}
