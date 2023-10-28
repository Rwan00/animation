import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  const AnimatedCounter({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> {
  bool visible = true;
  double _width = 50;
  double _height = 50;
  Color _color = Colors.pinkAccent;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animated Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              curve: Curves.easeInOutExpo,
              duration: const Duration(seconds: 3),
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
            ),
            AnimatedOpacity(
              opacity: (visible == true ? 0 : 1),
              duration: const Duration(seconds: 3),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Hello",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "It's",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "Me",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: Border.all(
          color: _color,
          width: 2,
        ),
        onPressed: () {
          setState(() {
            Random random = Random();
            visible = !visible;

            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), visible == true ? 1 : 0);
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: const Icon(Icons.flip_to_back_sharp),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
