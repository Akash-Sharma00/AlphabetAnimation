import 'package:dancing_text/animatio_type_1.dart';
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
          body: SingleChildScrollView(
        child: Column(
          children: const [
            AnimationTypeOne(
              text: "Flutter",
              repeat: true,
              textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            AnimationTypeOne(
              text: "Flutter",
              animationType: AnimationType.byXAxis,
              repeat: true,
              textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            AnimationTypeOne(
              text: "Flutter",
              animationType: AnimationType.byYAxis,
              repeat: true,
              textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            AnimationTypeOne(
              text: "Flutter",
              animationType: AnimationType.pendulum,
              duration: Duration(seconds: 200),
              repeat: true,
              textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            AnimationTypeOne(
              text: "Flutter",
              animationType: AnimationType.scaleUp,
              repeat: true,
              textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 5,
                  letterSpacing: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            AnimationTypeTwo(
              text: "Flutter",
              animationSync: AnimationSync.oneByOne,
              duration: Duration(milliseconds: 500),
              repeat: true,
              textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            AnimationTypeTwo(
              text: "Flutter",
              animationSync: AnimationSync.flip,
              textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              duration: Duration(milliseconds: 500),
              repeat: true,
            ),
            SizedBox(
              height: 20,
            ),
            AnimationTypeTwo(
              text: "Flutter",
              animationSync: AnimationSync.flow,
              textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              duration: Duration(milliseconds: 500),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
