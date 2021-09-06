import 'dart:convert';

import 'package:flutter_starter_project/model/user/user.dart';
import 'package:flutter_starter_project/utils/utils.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileRepo {
  Future<User> fetchUser() async {
    final res = await RestClient.get(
      api: 'users/1',
      endpoint: 'https://jsonplaceholder.typicode.com/',
    );
    final user = User.fromJson(jsonDecode(res.body));
    return user;
  }
}
