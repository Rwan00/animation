import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget
{
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "Hero Animation",
     home: Scaffold(
       appBar: AppBar(title: const Text("Hero Animation"),),
       body: Center(
         child: Builder(
           builder: (ctx)=> TextButton(
              child: const Hero(
                tag: "To_Flutter",
                child: FlutterLogo(size: 50,),
              ),
             onPressed: ()=> Navigator.push(
                 ctx,
                 MaterialPageRoute(
                     builder: (_) => const FlutterPage(),
                 )
             ),
           ),
         ),
       ),
     ),
   );
  }
}

class FlutterPage extends StatelessWidget
{
  const FlutterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.tealAccent,title: const Text("Flutter Page"),),
      body: ListView(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 190,
            child: Center(
              child: Hero(
                tag: "To_Flutter",
                child: Image.asset("assets/images/howl.jpg"),
              ),
            ),
          )
        ],
      ),
    );
  }

}