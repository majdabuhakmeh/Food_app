import 'package:flutter/material.dart';
import 'package:food_app/Pages/Home/food_page_body.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPagetState();
}

class _MainFoodPagetState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top:Dimensions.height45, bottom:Dimensions.height15 ),
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Column(
                          children: [
                            BigText(text:"Palestine",color:AppColors.mainColor ),
                            Row(
                              children: [
                                SmallText(text:AppConstants.appName,color: Colors.black54),
                                Icon(Icons.arrow_drop_down_rounded)
                              ],
                            ),
                          ],
                        ),
                        Center(child: Container(
                          width: Dimensions.height45,
                          height: Dimensions.height45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: Colors.blue,
                          ),
                          child: Icon(Icons.search, color: Colors.white,size:Dimensions.iconSize24),
                        ),

                        ),
                      ],
                    )
                )
            ),
            Expanded(child: SingleChildScrollView(
              child:FoodPageBody(),

            )),
          ],
        )


    );

  }
}