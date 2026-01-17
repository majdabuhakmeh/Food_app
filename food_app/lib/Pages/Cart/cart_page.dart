import 'package:flutter/material.dart';
import 'package:food_app/controllers/auth_controller.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/controllers/recommended_product_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../base/no_data_page.dart';
import '../../controllers/location_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(
            builder: (_cartContller) {
              return _cartContller.getItems.length > 0
                  ? Positioned(
                      top: Dimensions.height20 * 5,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: Dimensions.height15),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(
                            builder: (cartController) {
                              var _cartList = cartController.getItems;
                              return ListView.builder(
                                itemCount: _cartList.length,
                                itemBuilder: (_, index) {
                                  return Container(
                                    height: Dimensions.height20 * 5,
                                    width: double.maxFinite,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            var popularIndex =
                                                Get.find<
                                                      PopularProductController
                                                    >()
                                                    .popularProductList
                                                    .indexOf(
                                                      _cartList[index].product!,
                                                    );
                                            if (popularIndex >= 0) {
                                              Get.toNamed(
                                                RouteHelper.getPopularFood(
                                                  popularIndex,
                                                  "cartpage",
                                                ),
                                              );
                                            } else {
                                              var recommendedIndex =
                                                  Get.find<
                                                        RecommendedProductController
                                                      >()
                                                      .recommendedProductList
                                                      .indexOf(
                                                        _cartList[index]
                                                            .product!,
                                                      );

                                              if (recommendedIndex < 0) {
                                                Get.toNamed(
                                                  RouteHelper.getRecommendedFood(
                                                    recommendedIndex,
                                                    "cartpage",
                                                  ),
                                                );
                                              } else {
                                                var recommendedIndex =
                                                    Get.find<
                                                          RecommendedProductController
                                                        >()
                                                        .recommendedProductList
                                                        .indexOf(
                                                          _cartList[index]
                                                              .product!,
                                                        );
                                                if (recommendedIndex < 0) {
                                                  Get.snackbar(
                                                    "History Product",
                                                    "Product review is not available for history products",
                                                    backgroundColor:
                                                        AppColors.mainColor,
                                                    colorText: Colors.white,
                                                  );
                                                } else {
                                                  Get.toNamed(
                                                    RouteHelper.getRecommendedFood(
                                                      recommendedIndex,
                                                      "cartpage",
                                                    ),
                                                  );
                                                }
                                              }
                                            }

                                            child:
                                            Container(
                                              height: Dimensions.height20 * 5,
                                              width: Dimensions.width20 * 5,
                                              margin: EdgeInsets.only(
                                                bottom: Dimensions.height10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      Dimensions.radius20,
                                                    ),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    AppConstants.baseUrl +
                                                        AppConstants.uploadUrl +
                                                        cartController
                                                            .getItems[index]
                                                            .img!,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(width: Dimensions.width10),
                                        Expanded(
                                          child: Container(
                                            height: Dimensions.height20 * 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                  text: _cartList[index].name!,
                                                  color: Colors.black54,
                                                  size: Dimensions.font16,
                                                ),
                                                SmallText(text: "Spicy"),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                      text: _cartList[index]
                                                          .price
                                                          .toString(),
                                                      color: Colors.redAccent,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                        top:
                                                            Dimensions.height10,
                                                        bottom:
                                                            Dimensions.height10,
                                                        right:
                                                            Dimensions.width10,
                                                        left:
                                                            Dimensions.width10,
                                                      ),

                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              Dimensions
                                                                  .radius20,
                                                            ),
                                                        color: Colors.white,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                -1,
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .signColor,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          BigText(
                                                            text:
                                                                _cartList[index]
                                                                    .quantity
                                                                    .toString(),
                                                          ),
                                                          //popularProduct.inCartItems.toString()),
                                                          SizedBox(
                                                            width:
                                                                Dimensions
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                1,
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color: AppColors
                                                                  .signColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : NoDataPage(text: "Your cart is empty");
            },
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: Dimensions.ButtomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: cartController.getItems.length > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: Dimensions.width20 * 2,
                          right: Dimensions.width20 * 2,
                          top: Dimensions.height10,
                          bottom: Dimensions.height10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius20,
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: Dimensions.width10 / 2),
                            BigText(
                              text:
                                  "\$" + cartController.totalAmount.toString(),
                            ),
                            SizedBox(width: Dimensions.width10 / 2),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          if (Get.find<AuthController>().userLoggedIn()) {
                            if(Get.find<LocationController>().addressList.isEmpty){
                              Get.toNamed(RouteHelper.getAddressPage());

                            }
                          } else {

                            Get.toNamed(RouteHelper.getSignInPage());
                          }
                        },
                        child: Container(padding: EdgeInsets.only(left: Dimensions.width20 * 2, right: Dimensions.width20 * 2, top: Dimensions.height10, bottom: Dimensions.height10,),

                          child: BigText(
                            text: "Check out ",
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius20,
                            ),
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          );
        },
      ),
    );
  }
}
