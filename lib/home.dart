import 'package:flutter/material.dart';
import 'package:sec10/page_transition.dart';
import 'package:sec10/tween_animation.dart';

import 'animated_align.dart';
import 'animated_counter.dart';
import 'animated_default_text_style.dart';
import 'animated_padding.dart';
import 'animated_position.dart';
import 'animation_form.dart';
import 'custom_btn.dart';
import 'custom_explicit.dart';
import 'diff.dart';
import 'explicit3.dart';
import 'explicit_animation.dart';
import 'fade_in_image.dart';
import 'hero_animation.dart';
import 'like_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MyButton("Animated Align",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimAlign()));
            }),
            MyButton("Animated Counter",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimatedCounter()));
            }),
            MyButton("Animated Default Text Style",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimatedText()));
            }),
            MyButton("Animated Padding",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimPadding()));
            }),
            MyButton("Animated Position",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimatedPosition()));
            }),
            MyButton("Animated Form",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FormAnimation()));
            }),
            MyButton("Custom Explicit",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Custom()));
            }),
            MyButton("Diff",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Diff()));
            }),
            MyButton("Explicit3",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ExplicitThree()));
            }),
            MyButton("Explicit Animation",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ExplicitAnimation()));
            }),
            MyButton("Fade In Image",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Fade()));
            }),
            MyButton("Hero Animation",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HeroAnimation()));
            }),
            MyButton("Like Button",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LikeBtn()));
            }),
            MyButton("Page Transition",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimatedPage()));
            }),
            MyButton("Tween Animation",(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TweenAnimation()));
            }),
          ],
        ),
      ),
    );
  }
}
