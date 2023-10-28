import 'package:flutter/material.dart';

class AnimAlign extends StatefulWidget
{
  const AnimAlign({super.key});

  @override
  State<StatefulWidget> createState() => _AnimAlignState();

}

class _AnimAlignState extends State<AnimAlign>
{
  double dx = 0;
  double dy = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animated Align"),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.yellow[200],
          child: AnimatedAlign(
            duration: const Duration(seconds: 1),
            alignment: FractionalOffset(dx, dy),
            child: const FlutterLogo(size: 60,),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_ios_sharp),
        onPressed: (){
          setState(() {
            dx = (dx == 0 ? 1 : 0);
            dy = (dy == 0 ? 1 : 0);
          });
        },
      ),
    );
  }

}