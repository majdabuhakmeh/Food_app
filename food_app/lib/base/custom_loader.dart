import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/auth_controller.dart';
import '../utils/colors.dart';

class CustomLoader extends StatelessWidget{
  const CustomLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Center (
      child:
    Container(
      height: Dimensions.height20*5,
      width: Dimensions.height20*5,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(Dimensions.height20*5/2),

      ),
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    ));
}}