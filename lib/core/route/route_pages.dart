import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AnimationPage extends Page {
  const AnimationPage({required this.child});

  final Widget child;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: 0.0, end: 1.0);
        final curveTween = CurveTween(curve: Curves.easeInOut);

        return FadeTransition(
          opacity: animation.drive(curveTween).drive(tween),
          child: child,
        );
      },
    );
  }
}

class NoAnimationPage extends Page {
  const NoAnimationPage({required this.child});

  final Widget child;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      barrierDismissible: true,
      transitionDuration: const Duration(),
      pageBuilder: (_, __, ___) {
        return child;
      },
    );
  }
}

class BottomSheetPage extends Page {
  const BottomSheetPage({
    required this.child,
    this.heightPerc,
  });

  final Widget child;
  final double? heightPerc;

  @override
  Route<void> createRoute(BuildContext context) {
    return ModalBottomSheetRoute(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: SizedBox(
            height: heightPerc != null
                ? MediaQuery.of(context).size.height * heightPerc!
                : null,
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                    16,
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      settings: this,
      expanded: false,
      enableDrag: true,
      bounce: true,
    );
  }
}

class SwipableBackPage extends Page {
  const SwipableBackPage({
    required this.child,
    String? name,
  }) : super(
          name: name,
        );

  final Widget child;

  @override
  Route createRoute(BuildContext context) {
    return IosPageRouteBuilder(
      this,
      pageBuilder: (context, animation, animation2) {
        return child;
      },
    );
  }
}

class IosPageRouteBuilder<T> extends PageRoute<T> {
  IosPageRouteBuilder(
    RouteSettings? settings, {
    required this.pageBuilder,
  }) : super(settings: settings);

  final PageTransitionsBuilder matchingBuilder =
      const CupertinoPageTransitionsBuilder();

  final RoutePageBuilder pageBuilder;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String get barrierLabel => '';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return pageBuilder(context, animation, secondaryAnimation);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ClipRect(
      child: matchingBuilder.buildTransitions<T>(
        this,
        context,
        animation,
        secondaryAnimation,
        child,
      ),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(
        milliseconds: 300,
      );
}

class DialogPage extends Page<void> {
  const DialogPage({
    required this.child,
  });

  final Widget child;

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      builder: (context) => child,
      settings: this,
    );
  }
}
