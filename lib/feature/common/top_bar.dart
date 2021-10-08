import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:layout/src/layout.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? label;

  @override
  final Size preferredSize;

  const TopBar({
    Key? key,
    this.actions,
    this.label,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
  final double blurSigma;
  final Color color;

  const CircleBlurPainter({
    required this.color,
    required this.blurSigma,
  });

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
