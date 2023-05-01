<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
<center>
<font size = 5>Alphabet Animation</font>
</center>

Intro: Alphabet Animation is help flutter developer to animate every single alphabet of a string/word.

## Installing

1. Depends on it:<br>
    Add this to your package's pubspec.yaml file:
    ```yaml
    dependencies:
        alphabet_animation: ^0.0.1
    ```
2. Install it:<br>
    You can run command in terminal
     ```
    flutter pub get alphabet_animation
    ```
3. Import it<br>
    To import add to your desire file
     ```dart
    import 'package:alphabet_animation/packages.dart';
    ```

## Usage

Alphabet Animation is statefula package which create animation for text. include in you build method like:
 ```dart
    AnimationTypeOne(
        text: "Flutter",
        animationType: AnimationType.byXAxis,
        repeat: true,
        textStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
    ),
 ```
 OR
  ```dart
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
```


## About

It has properties to explore<br>
In AnimationTypeOne
<ol>

  <li>final String text</li>
  <li>final TextStyle? textStyle</li>
  <li>final Duration? duration</li>
  <li>final bool repeat</li>
  <li>final Alignment alignment</li>
  <li>final AnimationType animationType</li>

</ol>
In AnimationTypeTwo

<ol>
  <li>String text</li>
  <li>Duration duration</li>
  <li>bool repeat</li>
  <li>TextStyle? textStyle</li>
  <li>Axis orientation</li>
  <li>AnimationSync animationSync</li>
</ol>


## Code base
<a href="https://github.com/Akash-Sharma00/AlphabetAnimation">
Click to Explore
</a>
