import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';

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
                await NotificationController.createBasicNotification();
              },
              child: const Text('Basic notification'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await NotificationController.createBadgeNotification();
              },
              child: const Text('Badge notification'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                await NotificationController.createRedirectNotification();
              },
              child: const Text('Redirect notification'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Schedule',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () async {
                final plan = await pickSchedule(context);
                if (plan != null) {
                  await NotificationController.createScheduledNotification(
                    plan,
                  );
                }
              },
              child: const Text('Weekly scheduled notification'),
            ),
            const SizedBox(
              height: 16.0,
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
}
