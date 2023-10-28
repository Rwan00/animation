import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPosition extends StatefulWidget {
  const AnimatedPosition({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedPositionState();
}

class _AnimatedPositionState extends State<AnimatedPosition> {
  bool visible = true;
  Color _color = Colors.pinkAccent;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animated Position"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black12,
          ),
          const Center(
            child: Text(
              "Gintoki",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInBack,
            bottom: visible == true ? 250 : 350,
            right: 100,
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios_sharp),
        onPressed: () {
          setState(() {
            Random random = Random();
            visible = !visible;
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256),  1 );
            _borderRadius =
                BorderRadius.circular(random.nextInt(200).toDouble());
          });
        },
      ),
    );
  }
}
