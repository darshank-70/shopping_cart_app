import 'package:flutter/material.dart';
import 'package:shopping_cart/constants.dart';
import 'package:shopping_cart/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 355,
      child: Card(
        elevation: 1.2,
        margin: const EdgeInsets.only(left: 16.5, right: 16.5, top: 35.5),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Expanded(
                child: Image.network(product.productThumbnail),
              ),
              Row(
                children: [
                  Text('${product.productID}'),
                  const SizedBox(width: 15.5),
                  Text(
                    product.productName,
                    style: headLineStyle,
                  ),
                  const SizedBox(
                    width: 22.4,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_shopping_cart_rounded,
                      size: 43.5,
                      color: Colors.greenAccent,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5.5),
              Text(
                product.productDescription,
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
