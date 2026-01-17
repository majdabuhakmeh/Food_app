import 'package:flutter/material.dart';
import 'package:food_app/Pages/Cart/cart_history.dart';
import 'package:food_app/Pages/Home/main_food_page.dart';
import 'package:food_app/utils/colors.dart';

import '../account/account_page.dart';
import '../account/auth/sign_in_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex =0;
  List pages = [
    MainFoodPage(),
    Container(child: Text("history page"),),
    cartHistory(),
    AccountPage(),

  ];
  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: onTapNav,
          items: const[
            BottomNavigationBarItem(icon:Icon(Icons.home_outlined),
                label:"Home"),

            BottomNavigationBarItem(icon:Icon(Icons.archive),label:"history"),
            BottomNavigationBarItem(icon:Icon(Icons.shopping_cart),label:"cart"),
            BottomNavigationBarItem(icon:Icon(Icons.person),label:"me"),


          ]
      ),
    );
  }


}