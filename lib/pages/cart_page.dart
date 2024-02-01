import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shopping_cart/components/cart_item.dart';
import 'package:shopping_cart/models/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final Box cartBox;
  List cartItems = [];
  @override
  void initState() {
    super.initState();
    cartBox = Hive.box('cart_db');
    setState(() {
      getCartItems();
    });
  }

  getCartItems() {
    cartItems = cartBox.values.toList();
    print('cart ITEMS: ${cartItems}');
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cartItems.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => CartItem(product: cartItems[index]),
    );
  }
}
