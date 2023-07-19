import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationType { opacity, translateX }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({Key? key, required this.delay, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        AnimationType.opacity,
        Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
      )..tween(
        AnimationType.translateX,
        Tween(begin: -30.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
      );

    return PlayAnimationBuilder(
      tween: tween,
      duration: Duration(milliseconds: (500 * delay).round()),
      child: child,
      builder: (context, value, child) =>
          Opacity(
            opacity: value.get(AnimationType.opacity),
            child: Transform.translate(
              offset: Offset(0, value.get(AnimationType.translateX)),
              child: child,),
          ),
    );
  }
}
