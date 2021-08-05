import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    getIt<AppState>().logIn();
                  },
                  child: Text(LocaleKeys.login.tr()),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
