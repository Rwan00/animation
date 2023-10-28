import 'package:flutter/material.dart';

class AnimPadding extends StatefulWidget
{
  const AnimPadding({super.key});

  @override
  State<StatefulWidget> createState() => _AnimPaddingState();

}

class _AnimPaddingState extends State<AnimPadding>
{
  double padVal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animated Padding"),
      ),
      body: AnimatedPadding(
        duration: const Duration(seconds: 1),
        padding:  EdgeInsets.all(padVal),
        child: Container(
          color: Colors.purple,
          height: 200,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios_sharp),
        onPressed: (){
          setState(() {
            padVal = (padVal == 0? 25 : 0);
          });
        },
      ),
    );
  }

}