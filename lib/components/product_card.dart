import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shopping_cart/constants.dart';
import 'package:shopping_cart/models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late final Box cartBox;
  List keyList = [];
  @override
  initState() {
    super.initState();
    cartBox = Hive.box('cart_db');
  }

  _modifyCart(Product product) {
    keyList = cartBox.keys.toList();
    print('No of items in Cart ${cartBox.length}');
    //if product is already in cart: remove it
    if (keyList.contains(product.productID)) {
      cartBox.delete(product.productID);
    }
    //if product is not in cart: add it
    else {
      cartBox.put(product.productID, product);
    }
    print('UPDATED CART ${cartBox.keys}');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 355,
      child: Card(
        elevation: 1.2,
        margin: const EdgeInsets.only(left: 16.5, right: 16.5, top: 35.5),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Expanded(
                child: Image.network(widget.product.productThumbnail),
              ),
              Row(
                children: [
                  Text('${widget.product.productID}'),
                  const SizedBox(width: 15.5),
                  Text(
                    widget.product.productName,
                    style: headLineStyle,
                  ),
                ],
              ),
              const SizedBox(width: 22.4),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${widget.product.productPrice} INR',
                        style: priceStyle),
                    IconButton(
                      onPressed: () => _modifyCart(widget.product),
                      icon: const Icon(
                        Icons.add_shopping_cart_rounded,
                        size: 43.5,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5.5),
              Text(
                widget.product.productDescription,
                style: subLineStyle,
              ),
              const SizedBox(height: 5.5),
            ],
          ),
        ),
      ),
    );
  }
}
