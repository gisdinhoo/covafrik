import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Statistic extends StatelessWidget {
  final color, number, text;
  const Statistic({this.color, this.number, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: color.withOpacity(0.5)),
            child: Container(
                margin: EdgeInsets.all(4),
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(color: color, width: 2)))),
        Text(
          number,
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold, fontSize: 40, color: color),
        ),
        Text(
          text,
          style: GoogleFonts.quicksand(),
        )
      ],
    );
  }
}