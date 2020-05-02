import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Ball Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BallPage(),
    );
  }
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: Icon(Icons.help),
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  void randomPicture() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
      print('pressed ball$ballNumber.png');
    });
  }

  //Simple Animation
  void changeBackgroundColor() {
    final random = Random();
    setState(() {
      // Generate a random color.
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }

  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: _color,
        borderRadius: _borderRadius,
      ),
      // Define how long the animation should take.
      duration: Duration(seconds: 1),
      // Provide an optional curve to make the animation feel smoother.
      curve: Curves.fastOutSlowIn,

      child: Center(
        child: FlatButton(
          onPressed: () {
            randomPicture();
            changeBackgroundColor();
          },
          child: Image.asset('assets/images/ball$ballNumber.png'),
        ),
      ),
    );
  }
}
