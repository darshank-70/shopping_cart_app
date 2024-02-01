import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shopping_cart/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box cartBox;
  bool isCartBoxOpen = false;
  @override
  void initState() {
    super.initState();
    cartBox = Hive.box('cart_db');
    isCartBoxOpen = cartBox.isOpen ? true : false;
    print('BOX <--$isCartBoxOpen-->');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Text('Welcome', style: headLineStyle),
      ),
    );
  }
}
