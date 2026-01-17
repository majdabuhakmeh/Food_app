import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({super.key,this.color= const Color(0xFF332d2b) , required this.text,this.size=0,this.overflow=TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(text,overflow: overflow,
      style: TextStyle(color: color,
          fontFamily: 'Roboto',
          fontSize: size==0?Dimensions.font20:size,
          fontWeight: FontWeight.w400),
    );
  }
}