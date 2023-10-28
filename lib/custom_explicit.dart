import 'package:flutter/material.dart';

class Custom extends StatefulWidget
{
  const Custom({super.key});

  @override
  State<StatefulWidget> createState() => _CustomState();

}

class _CustomState extends State<Custom> with SingleTickerProviderStateMixin
{
  AnimationController? _controller;
  Animation<Size>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 300),
    )..repeat();
    _animation = Tween<Size>(begin: const Size(200,150),end: const Size(200,350),).animate(
      CurvedAnimation(
          parent: _controller!,
          curve: Curves.bounceInOut
      )
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
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          AnimatedBuilder(
            animation: _controller!,
            builder: (ctx,child)=> FlutterLogo(size: _animation?.value.height,),
          ),
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            title: const Text("Forward"),
            tileColor: Colors.blue,
            onTap: ()=> _controller?.forward(),
          ),
          ListTile(
            leading: const Icon(Icons.arrow_back_ios_new_outlined) ,
            title:  const Text("Back"),
            tileColor: Colors.pinkAccent,
            onTap: ()=> _controller?.reverse(),
          )
        ],
      ),
    );
  }

}