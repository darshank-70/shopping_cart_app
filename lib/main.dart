import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopping_cart/pages/cart_page.dart';
import 'package:shopping_cart/pages/home_page.dart';
import 'package:shopping_cart/pages/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  var pages = const [HomePage(), SearchPage(), CartPage()];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: GNav(
          selectedIndex: selectedIndex,
          onTabChange: (value) {
            print('====$value====');
            setState(
              () {
                selectedIndex = value;
              },
            );
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(icon: Icons.shopping_cart, text: 'Cart'),
          ],
        ),
      ),
    );
  }
}
