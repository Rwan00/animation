import "dart:math";

import "package:flutter/material.dart";

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  double _fontSize = 30;
  Color _color = Colors.orangeAccent;
  FontWeight _fontWieght = FontWeight.bold;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animated Default Text Style"),
      ),
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          style: TextStyle(
              color: _color, fontWeight: _fontWieght, fontSize: _fontSize),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Hello"),
              Text("It's"),
              Text("Nice"),
              Text("To"),
              Text("Meet"),
              Text("You"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios_sharp),
        onPressed: () {
          Random random = Random();
          setState(() {
            _fontSize = random.nextInt(60).toDouble();
             _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
             _fontWieght = (_fontWieght == FontWeight.bold ? FontWeight.normal : FontWeight.bold);
          });
        },
      ),
    );
  }
}
