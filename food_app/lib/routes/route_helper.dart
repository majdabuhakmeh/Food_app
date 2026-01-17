import 'package:food_app/Pages/Cart/cart_page.dart';
import 'package:food_app/Pages/Food/popular_food_detail.dart';
import 'package:food_app/Pages/Food/recommended_food_detail.dart';
import 'package:food_app/Pages/Home/home_page.dart';
import 'package:food_app/Pages/account/auth/sign_in_page.dart';
import 'package:food_app/Pages/account/auth/sign_up_page.dart';
import 'package:food_app/Pages/splash/splash_page.dart';
import 'package:get/get.dart';

import '../Pages/address/add_address_page.dart';

class RouteHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';
  static const String signIn = '/sign-in'; //
  static const String signUp = '/sign-up'; //
  static const String addAddress="/add-address";

  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getSignInPage() => signIn;
  static String getSignUpPage() => signUp;

  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => cartPage;
  static String getAddressPage()=>'$addAddress';
  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashPage()),
    GetPage(name: initial, page: (){
      return HomePage();
    }),
    GetPage(name: signIn, page: (){
      return SignInPage();
    }),

    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(name: addAddress,page:(){
      return AddAddressPage();
    })
  ];
}
