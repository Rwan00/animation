import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AnimatedPage extends StatelessWidget {
  const AnimatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Page Transition"),
      ),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () => Navigator.push(
                context,
                PageTransition(
                  child: const Another(),
                  type: PageTransitionType.fade,
                  alignment: Alignment.bottomLeft,
                  duration: const Duration(seconds: 1),
                )),
            icon: const Icon(Icons.arrow_forward_ios_sharp),
            label: const Text("Go To Another Page")),
      ),
    );
  }
}

class Another extends StatelessWidget {
  const Another({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("Another Page"),
      ),
      body: null,
    );
  }
}
