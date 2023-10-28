import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';



class MyButton extends StatelessWidget {
  final String label;
  final Function() onTap;

  const MyButton(this.label, this.onTap, { super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70.0,vertical: 15),
        child: Container(
          alignment: Alignment.center,
          width: 312,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CupertinoColors.systemPurple,
          ),
          child: Text(
            label,
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}