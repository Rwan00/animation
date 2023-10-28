import 'package:flutter/material.dart';

class ExplicitThree extends StatefulWidget {
  const ExplicitThree({super.key});

  @override
  State<StatefulWidget> createState() => _ExplicitThreeState();
}

class _ExplicitThreeState extends State<ExplicitThree>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<TextStyle>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = TextStyleTween(
            begin: const TextStyle(color: Colors.blue,fontWeight: FontWeight.normal,fontSize: 25),
            end: const TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold,fontSize: 85))
        .animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInCirc,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: DefaultTextStyleTransition(
          style: _animation!,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Text("Hello")
          ),
        ),
      ),
    );
  }
}
