import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shopping_cart/constants.dart';
import 'package:shopping_cart/models/product.dart';

class CartItem extends StatefulWidget {
  final Product product;
  const CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late Box cartBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBox = Hive.box('cart_db');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Card(
        elevation: 1.5,
        child: Column(
          children: [
            Image.network(
              widget.product.productThumbnail,
              height: 65,
              width: 145,
              fit: BoxFit.cover,
            ),
            Text(
              widget.product.productName,
              style: subLineStyle,
            ),
            const SizedBox(height: 12),
            Text('${widget.product.productPrice} /-', style: priceStyle),
            const SizedBox(height: 12),
            Expanded(
              child: IconButton(
                onPressed: () => _deleteFromCart(widget.product.productID),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _deleteFromCart(int productID) {
    setState(() {
      cartBox.delete(productID);
    });
  }
}
