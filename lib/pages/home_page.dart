import 'package:flutter/material.dart';
import 'package:shopping_cart/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
