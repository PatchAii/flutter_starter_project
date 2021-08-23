import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/route/route.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          routemaster.push('/settings');
        },
        child: SvgPicture.asset(
          'assets/logo/patchai.svg',
        ),
      ),
    );
  }
}
