import 'dart:convert';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
   /* sharedPreferences.remove(AppConstants.cartList);
    sharedPreferences.remove(AppConstants.cartHistoryList);
    return;*/

    var time=DateTime.now().toString();
    cart =[];
    //convert object to string bc shared preferences only accepts string
    cartList.forEach( (element) {
      element.time=time;
      return cart.add(jsonEncode(element));
    });
    
    sharedPreferences.setStringList(AppConstants.cartList, cart);
    //print(sharedPreferences.getStringList(AppConstants.cartList));
   // getCartList();
  }
  List<CartModel> getCartList() {
    List<String> carts =[];
    if(sharedPreferences.containsKey(AppConstants.cartList)){
      carts = sharedPreferences.getStringList(AppConstants.cartList)!;
      //print("inside get cart list"+carts.toString());
    }
    List<CartModel> cartList =[];
    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;
  }
  List<CartModel> getCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.cartHistoryList)){
     // cartHistory=[];
      cartHistory=sharedPreferences.getStringList(AppConstants.cartHistoryList)!;
    }
    List<CartModel> cartListHistory=[];
    cartHistory.forEach((element) {
      cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartListHistory;
  }
  void AddToCartHistoryList(){
   if(sharedPreferences.containsKey(AppConstants.cartHistoryList)){
      cartHistory=sharedPreferences.getStringList(AppConstants.cartHistoryList)!;
    }
    for(int i=0;i<cart.length;i++){
      print("History List ${cart[i]}");
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.cartHistoryList, cartHistory);
    print("The length of history list is${getCartHistoryList().length}");
    for (int j = 0; j < getCartHistoryList().length; j++) {
      print("the time for the order is ${getCartHistoryList()[j].time}");
    }
  } 
  void removeCart(){
    cart=[];
    sharedPreferences.remove(AppConstants.cartList);
  }
  void clearCartHistory(){
    removeCart();
    cartHistory=[];
    sharedPreferences.remove(AppConstants.cartHistoryList);
  }

}