import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:flutter_starter_project/core/notification/notification_examples.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    Key? key,
    this.subPage = false,
  }) : super(key: key);

  final bool subPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subPage ? null : AppBar(),
      body: Center(
        child: SingleChildScrollView(
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
                  await NotificationExamples.createBasicNotification();
                },
                child: const Text('Basic notification'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  await NotificationExamples.createBadgeNotification();
                },
                child: const Text('Badge notification'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  await NotificationExamples.createRedirectNotification();
                },
                child: const Text('Redirect notification'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  await NotificationExamples.createActionNotification();
                },
                child: const Text('Action notification'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  await NotificationExamples.createPostponeNotification();
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
                    await NotificationExamples
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
                    await NotificationExamples.createScheduledNotification(
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
                onPressed: () async {
                  final plan = await pickSchedule(context);
                  if (plan != null) {
                    await NotificationExamples.createScheduledNotification(
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
                  await NotificationExamples
                      .createMinuteRepeatingNotification();
                },
                child: const Text('Minute repeating notification'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  await NotificationExamples
                      .createTargetRepeatingNotification();
                },
                child: const Text('Every hour at minute 10 and 30 seconds'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  await NotificationController.cancelScheduledNotifications();
                },
                child: const Text('Cancel all scheduled'),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
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
