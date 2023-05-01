import 'package:flutter/material.dart';
import 'dart:math' as math;

enum AnimationSync { flip, oneByOne, flow }

class AnimationTypeTwo extends StatefulWidget {
  final String text;
  final Duration duration;
  final bool repeat;
  final TextStyle? textStyle;
  final Axis orientation;
  final AnimationSync animationSync;
  const AnimationTypeTwo(
      {super.key,
        required this.text,
        this.repeat = true,
        this.orientation = Axis.horizontal,
        required this.animationSync,
        this.textStyle,
        this.duration = const Duration(seconds: 2)});

  @override
  State<AnimationTypeTwo> createState() => _AnimationTypeTwoState();
}

class _AnimationTypeTwoState extends State<AnimationTypeTwo> with TickerProviderStateMixin {
  late List<AnimationController> _listAnimationController;
  List<String> _textList = [];
  @override
  void initState() {
    super.initState();
    _textList = widget.text.split('');
    _listAnimationController = List.generate(_textList.length,
            (index) => AnimationController(vsync: this, duration: widget.duration));
    startToAnimate();
  }

  startToAnimate() async {
    for (int i = 0; i < _listAnimationController.length; i++) {
      _listAnimationController[i].repeat();

      await Future.delayed(widget.duration);
    }
    if (!widget.repeat) {
      for (int i = 0; i < _listAnimationController.length; i++) {
        _listAnimationController[i]
          ..reset()
          ..stop();
        await Future.delayed(widget.duration);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _listAnimationController.every((element) {
      element.dispose();
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: widget.orientation,
        children: [
          for (int i = 0; i < _textList.length; i++)
            Builder(builder: (context) {
              return AnimatedBox(
                controller: _listAnimationController[i],
                alignment: Alignment.center,
                text: _textList[i],
                style: widget.textStyle,
                animationSync: widget.animationSync,
              );
            }),
        ],
      ),
    );
  }
}

class AnimatedBox extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Alignment alignment;
  final Animation<double>? animation;
  final AnimationSync animationSync;

  const AnimatedBox({
    super.key,
    required AnimationController controller,
    required this.text,
    this.style,
    required this.alignment,
    required this.animationSync,
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
          transform: checkAnimationSync(animationSync),
          child: Text(
            text,
            style: style,
          ),
        );
      },
    );
  }

  checkAnimationSync(AnimationSync animationSync) {
    switch (animationSync) {
      case AnimationSync.flip:
        return Matrix4.identity()..rotateX(_controller.value * 2 * math.pi);
      case AnimationSync.oneByOne:
        return Matrix4.identity()
          ..splatDiagonal(_controller.value * 2 * math.pi);
      case AnimationSync.flow:
        return Matrix4.identity()..translate(_controller.value * 2 * math.pi);

      default:
    }
  }
}
