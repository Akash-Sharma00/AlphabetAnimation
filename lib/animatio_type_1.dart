import 'package:flutter/material.dart';
import 'dart:math' as math;

enum AnimationType { byXAxis, byYAxis, byZAxis, pendulum, scaleUp }

class AnimationTypeOne extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration? duration;
  final bool repeat;
  final Alignment alignment;
  final AnimationType animationType;
  const AnimationTypeOne(
      {super.key,
      required this.text,
      this.textStyle,
      this.duration,
      this.alignment = Alignment.center,
      this.repeat = false,
      this.animationType = AnimationType.byZAxis});

  @override
  State<AnimationTypeOne> createState() => _AnimationTypeOneState();
}

class _AnimationTypeOneState extends State<AnimationTypeOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<String> textList = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: widget.duration ?? const Duration(seconds: 2));
    _animation = Tween<double>(begin: -45, end: 45).animate(_controller);
    if (widget.repeat) {
      _controller.repeat();
    } else {
      _controller.forward();
    }

    textList = widget.text.trim().split("");
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          for (int i = 0; i < textList.length; i++)
            AnimatedTextComponent(
              controller: _controller,
              animation: _animation,
              alignment: widget.alignment,
              text: textList[i],
              style: widget.textStyle,
              rotateByAxis: widget.animationType,
            ),
        ],
      ),
    );
  }
}

class AnimatedTextComponent extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Alignment alignment;
  final Animation<double>? animation;
  final AnimationType rotateByAxis;

  const AnimatedTextComponent({
    super.key,
    required AnimationController controller,
    required this.text,
    this.style,
    required this.alignment,
    required this.rotateByAxis,
    this.animation,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          alignment: alignment,
          transform: defineAxis(rotateByAxis),
          child: Text(
            text,
            style: style,
          ),
        );
      },
    );
  }

  defineAxis(AnimationType rotateByAxis) {
    switch (rotateByAxis) {
      case AnimationType.byXAxis:
        return Matrix4.identity()
          ..rotateX(
            _controller.value * 2 * math.pi,
          );
      case AnimationType.byYAxis:
        return Matrix4.identity()
          ..rotateY(
            _controller.value * 2 * math.pi,
          );
      case AnimationType.byZAxis:
        return Matrix4.identity()..rotateZ(_controller.value * 2 * math.pi);

      case AnimationType.scaleUp:
        return Matrix4.identity()..scale(_controller.value * 2 * math.pi);

      case AnimationType.pendulum:
        return Matrix4.identity()
          ..rotateZ(
            math.sin(math.pi * 2 * animation!.value),
          );

      default:
    }
  }
}
