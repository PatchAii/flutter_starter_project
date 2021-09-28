import 'package:flutter/material.dart';
import 'package:flutter_starter_project/feature/profile/view/widgets/profile_actions.dart';
import 'package:flutter_starter_project/feature/profile/view/widgets/profile_data.dart';
import 'package:flutter_starter_project/model/model.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileData(
            user: user,
          ),
          const ProfileActions(),
        ],
      ),
    );
  }
}
