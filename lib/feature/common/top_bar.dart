import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core/core.dart';
import 'package:layout/layout.dart';
import 'package:provider/provider.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  const TopBar({
    Key? key,
    this.actions,
    this.label,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final List<Widget>? actions;
  final String? label;

  @override
  final Size preferredSize;

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    final _enableBackButton = context.watch<NavObserver>().enableBackButton;

    return AppBar(
      automaticallyImplyLeading: false,
      leading: _enableBackButton
          ? IconButton(
              icon: const BackButtonIcon(),
              onPressed: () {
                RouteApp.routemaster.history.back();
              },
            )
          : null,
      title: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: BlurWidget(),
          ),
          if (widget.label != null) Text(widget.label!),
        ],
      ),
      actions: widget.actions,
      elevation: context.layout.breakpoint > LayoutBreakpoint.sm ? 1 : 0,
      centerTitle: true,
    );
  }
}

class CircleBlurPainter extends CustomPainter {
  const CircleBlurPainter({
    required this.color,
    required this.blurSigma,
  });

  final double blurSigma;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = min(size.width, size.height)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BlurWidget extends StatelessWidget {
  const BlurWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircleBlurPainter(
        blurSigma: 3.0,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
