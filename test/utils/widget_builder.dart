import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:layout/layout.dart';

DeviceBuilder getDefaultBuilder(Widget child) {
  return DeviceBuilder()
    ..overrideDevicesForAllScenarios(
      devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ],
    )
    ..addScenario(
      widget: Layout(child: child),
    );
}

Widget mountApp(Widget child) {
  return MaterialApp(
    home: child,
  );
}
