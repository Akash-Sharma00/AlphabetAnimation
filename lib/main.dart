import 'package:dancing_text/animation_type_2.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          AnimationTypeTwo(
            text: "Flutter",
            animationSync: AnimationSync.oneByOne,
            duration: Duration(milliseconds: 500),
            repeat: false,
          ),
          AnimationTypeTwo(
            text: "Flutter",
            animationSync: AnimationSync.flip,
            textStyle: TextStyle(letterSpacing: 100),
            duration: Duration(milliseconds: 500),
            repeat: false,
          ),
          AnimationTypeTwo(
            text: "Flutter",
            animationSync: AnimationSync.flow,
            textStyle: TextStyle(letterSpacing: 50),
            duration: Duration(milliseconds: 500),
          ),
          AnimationTypeTwo(
            text: "Flutter",
            animationSync: AnimationSync.oneByOne,
            duration: Duration(milliseconds: 500),
          ),
        ],
      )),
    );
  }
}
