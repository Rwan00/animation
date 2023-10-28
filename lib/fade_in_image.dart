import 'package:flutter/material.dart';

class Fade extends StatefulWidget {
  const Fade({super.key});

  @override
  State<StatefulWidget> createState() => _FadeState();
}

class _FadeState extends State<Fade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fade Image"),
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: FadeInImage(
            placeholder:AssetImage("assets/images/sign.jpg") ,
              image: NetworkImage(
                  "https://th.bing.com/th/id/OIP.CXNmfhIynS6F7QVgR3laxwHaEK?pid=ImgDet&rs=1"),
          ),
        ),
      ),
    );
  }
}
