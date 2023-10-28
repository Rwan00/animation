import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget
{
  const TweenAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
{
  double _angle = 0;
  double _value = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       title: const Text("Tween Animation"),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           TweenAnimationBuilder<double>(
             curve: Curves.easeInCubic,
               duration: const Duration(seconds: 1),
               tween: Tween(begin: 0,end: _angle),
               builder: (_,angle,child) => Transform.rotate(
                 angle: angle,
                 child: child,
               ),
               child: Container(
                 height: 200,
                 width: 300,
                 color: Colors.teal,
               ),
           ),

           Text(
             "${(_value * (180/pi)).round()}",
             style: const TextStyle(fontSize: 30),
           ),
           Slider(
               value: _value,
               onChanged: (val) => setState(() {
                 _value = val;
                 _angle = val;
               }),
             min: 0,
             max: pi * 2,
             divisions: 4,
           )
         ],
       ),
     ),

   );
  }

}