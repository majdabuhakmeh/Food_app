
import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/controllers/recommended_product_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
 const RecommendedFoodDetail({super.key, required this.pageId, required  this.page});

  @override
  Widget build(BuildContext context) {
    var product =Get.find<RecommendedProductController>().recommendedProductList[pageId]; 
        Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());

    return Scaffold(
    body:CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  if(page=="cartpage"){
                    Get.toNamed(RouteHelper.getCartPage());
                  }
                  else{
                  Get.toNamed(RouteHelper.getInitial());}
                },
                child:AppIcon(icon:Icons.clear),
                ),
              //AppIcon(icon:Icons.shopping_cart_outlined)
                   GetBuilder<PopularProductController>(builder: (controller)
                  {
                    return GestureDetector(
                      onTap: (){
                        if(controller.totalItems>=1)
                        Get.toNamed(RouteHelper.getCartPage());
                      },
                      child:Stack(
                     children: [
                      AppIcon(icon: Icons.shopping_cart_outlined,),
                      controller.totalItems>=1?
                      Positioned(
                        right:0,top:0,
                        
                          child:AppIcon(
                          icon: Icons.circle,
                          size:20,
                          iconColor: Colors.transparent,
                          backgroundColor: AppColors.mainColor,
                        
                      )):Container(),
                        controller.totalItems>=1?
                      Positioned(
                        right:3,top:3,
                        child: BigText(
                          text: controller.totalItems.toString(),
                          size:12,
                          color: Colors.white,
                        ),
                      ):Container()

                     ],
                     ) );
                  }
                  )

            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top:5,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              child: Center(child: BigText(size: Dimensions.font26,text: product.name!)),
            ),
          ),
          pinned: true,
          backgroundColor: Colors.yellow,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(AppConstants.baseUrl+AppConstants.uploadUrl+product.img!,
            width:double.maxFinite ,
            fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20),
                child: ExpandableTextWidget(text:product.description! ),
              )
            ],
          ),
        )
      ],
    ),
    bottomNavigationBar:GetBuilder<PopularProductController>(builder: (controller)
    {
      return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(
            left:Dimensions.width20*2.5,
            right: Dimensions.width20*2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10,
          ),
        child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              controller.setQuantity(false);
            },
            child:AppIcon(icon: Icons.remove,
          backgroundColor: AppColors.mainColor,
          iconColor: Colors.white,
          iconSize: Dimensions.iconSize24,)
           )
        ,
          BigText(text: "\$ ${product.price!} X ${controller.inCartItems}", size: Dimensions.font26, color: AppColors.mainBlackColor,),
           GestureDetector(
            onTap: (){
              controller.setQuantity(true);
            },
            child:AppIcon(icon: Icons.add,
          backgroundColor: AppColors.mainColor,
          iconColor: Colors.white,
          iconSize: Dimensions.iconSize24,)
           )
        
        ],
      )
        ),
       Container(
        height: Dimensions.ButtomHeightBar,
        padding: EdgeInsets.all(Dimensions.height20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top:Dimensions.height20,bottom: Dimensions.height20,right: Dimensions.width20,left:Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                
              ),
              child: Icon(Icons.favorite,color: AppColors.mainColor,)
            ),
           GestureDetector(
                onTap: (){
                  controller.addItem(product);
                },
            child: Container(
                  padding: EdgeInsets.all(Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
            child:BigText(text: "\$ ${product.price!} | Add to cart",
                 color: Colors.white,),
               ),
           )
          ],
        ),
      ),
      ],
      
    );
    
    }),
    );
  }
}
