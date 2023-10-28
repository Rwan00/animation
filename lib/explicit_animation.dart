import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget
{
  const ExplicitAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _ExplicitAnimationState();

}

class _ExplicitAnimationState extends State<ExplicitAnimation> with SingleTickerProviderStateMixin
{
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 3),
      lowerBound: 0,
      upperBound: 1
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut
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
     backgroundColor: Colors.yellow,
     body: Center(
       child: FadeTransition(
         opacity : _animation!,
         child: const Padding(
           padding: EdgeInsets.all(8),
           child: FlutterLogo(size: 350,),
         ),
       ),
     ),
   );
  }

}