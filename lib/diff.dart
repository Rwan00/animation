import 'dart:math';

import 'package:flutter/material.dart';

class Diff extends StatefulWidget {
  const Diff({super.key});

  @override
  State<StatefulWidget> createState() => _DiffState();
}

class _DiffState extends State<Diff> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Size>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 5),
      lowerBound: 0.5,
      upperBound: 3,
    )..repeat();
    _animation = Tween<Size>(
      begin: const Size(200,150),
      end: const Size(200,350),
    ).animate(CurvedAnimation(
        parent: _controller!,
        curve: Curves.linear,
    ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Transform.scale(
          scale: 3,
          child: AnimatedBuilder(
            animation: _controller!,  
            builder: (ctx,child) =>  Transform.rotate(angle: _controller!.value * 2 * pi,child: child,),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side:  BorderSide(width: _controller!.value),
              ),
              child: const Text("Click Me!"),
            ),
          )
        ),
      ),
    );
  }
}

/*class OutlinedButtonTransition extends AnimatedWidget
{
  const OutlinedButtonTransition({super.key, animatedWidth}) : super(listenable: animatedWidth);
  Animation<double>? get animatedWidth =>listenable;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side:  BorderSide(width: animatedWidth!.value),
      ),
      child: const Text("Click Me!"),
    );
  }

}*/
