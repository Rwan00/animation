import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeBtn extends StatefulWidget
{
  const LikeBtn({super.key});

  @override
  State<StatefulWidget> createState()=> _LikeBtnState();

}

class _LikeBtnState extends State<LikeBtn>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Drawer"),backgroundColor: Colors.amber,),
      body:  Center(
        child: LikeButton(
          size: 60,
          likeBuilder: (bool isLiked){
            return Icon(
              Icons.gesture,
              size: 60,
              color: isLiked? Colors.black87:Colors.lightGreenAccent,
            );
          },
          likeCount: 900,
          bubblesColor: const BubblesColor(
              dotPrimaryColor: Colors.deepPurple,
              dotSecondaryColor: Colors.greenAccent
          ),
          circleColor: const CircleColor(
              start: Colors.purpleAccent,
              end: Colors.cyanAccent
          ),
        ),
      )
    );
  }

}