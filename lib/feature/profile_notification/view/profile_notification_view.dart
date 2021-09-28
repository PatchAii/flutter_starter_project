import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/feature/profile_notification/repo/profile_notification_controller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    Key? key,
    this.subPage = false,
  }) : super(key: key);

  final bool subPage;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var token = '';

  @override
  void initState() {
    NotificationController.getFCMToken().listen(
      (token) {
        setState(() {
          this.token = token!;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.subPage ? null : AppBar(),
      body: NotificationContent(
        token: token,
      ),
    );
  }
}

class NotificationContent extends StatelessWidget {
  final token;

  const NotificationContent({
    Key? key,
    this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(
              'Notification',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await ProfileNotificationController.createBasicNotification();
              },
              child: const Text('Basic temp notification'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await ProfileNotificationController.createBadgeNotification();
              },
              child: const Text('Badge notification'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await ProfileNotificationController
                    .createRedirectNotification();
              },
              child: const Text('Redirect notification'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await ProfileNotificationController.createActionNotification();
              },
              child: const Text('Action notification'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await ProfileNotificationController
                    .createPostponeNotification();
              },
              child: const Text('Postpone notification'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Repeated',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                final sec = await pickSeconds(context);
                if (sec != null) {
                  await ProfileNotificationController
                      .createSecondsRepeatingNotification(
                    sec,
                  );
                }
              },
              child: const Text('Repeating notification'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Scheduled',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                final plan = await pickSchedule(context);
                if (plan != null) {
                  await ProfileNotificationController
                      .createScheduledNotification(
                    notificationSchedule: plan,
                  );
                }
              },
              child: const Text('Scheduled notification, once'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              key: const Key('pick_schedule'),
              onPressed: () async {
                final plan = await pickSchedule(context);
                if (plan != null) {
                  await ProfileNotificationController
                      .createScheduledNotification(
                    notificationSchedule: plan,
                    repeats: true,
                  );
                }
              },
              child: const Text('Scheduled notification, repeat'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await ProfileNotificationController
                    .createMinuteRepeatingNotification();
              },
              child: const Text('Minute repeating notification'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await ProfileNotificationController
                    .createTargetRepeatingNotification();
              },
              child: const Text('Every hour at minute 10 and 30 seconds'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'FCM token:',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SelectableText(
                    token,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Notification background:',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
          ],
        ),
      ),
    );
  }

  Future<NotificationWeekAndTime?> pickSchedule(
    BuildContext context,
  ) async {
    final weekdays = <String>[
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];
    TimeOfDay? timeOfDay;
    final now = DateTime.now();
    int? selectedDay;

    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            key: const Key('pick_schedule_dialog'),
            title: const Text(
              'I want to be reminded every:',
              textAlign: TextAlign.center,
            ),
            content: Wrap(
              alignment: WrapAlignment.center,
              spacing: 3,
              children: [
                for (int index = 0; index < weekdays.length; index++)
                  ElevatedButton(
                    onPressed: () {
                      selectedDay = index + 1;
                      Navigator.pop(context);
                    },
                    child: Text(weekdays[index]),
                  ),
              ],
            ),
          );
        });

    if (selectedDay != null) {
      timeOfDay = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(
            now.add(
              const Duration(minutes: 1),
            ),
          ),
          builder: (BuildContext context, Widget? child) {
            return child!;
          });

      if (timeOfDay != null) {
        return NotificationWeekAndTime(
            dayOfTheWeek: selectedDay!, timeOfDay: timeOfDay);
      }
    }
    return null;
  }

  Future<int?> pickSeconds(
    BuildContext context,
  ) async {
    int? selectedTime;

    await showDialog(
        context: context,
        builder: (context) {
          final times = <int>[
            60,
            120,
            600,
          ];
          return AlertDialog(
            title: const Text(
              'I want the notification to repeat every:',
              textAlign: TextAlign.center,
            ),
            content: Wrap(
              alignment: WrapAlignment.center,
              spacing: 3,
              children: [
                for (int index = 0; index < times.length; index++)
                  ElevatedButton(
                    onPressed: () {
                      selectedTime = times[index];
                      Navigator.pop(context);
                    },
                    child: Text('${times[index] / 60} min.'),
                  ),
              ],
            ),
          );
        });

    return selectedTime;
  }
}
