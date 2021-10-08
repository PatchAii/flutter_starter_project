import 'package:flutter/material.dart';
import 'package:flutter_starter_project/model/model.dart';
import 'package:layout/layout.dart';

class ProfileData extends StatelessWidget {
  final User user;

  const ProfileData({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(.7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: (context.layout.breakpoint > LayoutBreakpoint.xs)
                      ? 75.0
                      : 25.0,
                  backgroundImage:
                      Image.network('https://placekitten.com/500/500').image,
                  backgroundColor: Colors.transparent,
                ),
              ),
              if (context.layout.breakpoint > LayoutBreakpoint.xs)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Id: ${user.id}',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'Name: ${user.name}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Username: ${user.username}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Email: ${user.email}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'Phone: ${user.phone}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Website: ${user.website}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Id: ${user.id}',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          'Name: ${user.name}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Username: ${user.username}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          'Email: ${user.email}',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          'Phone: ${user.phone}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Website: ${user.website}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
