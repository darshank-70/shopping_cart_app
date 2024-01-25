import 'package:flutter/material.dart';
import 'package:shopping_cart/components/product_card.dart';
import 'package:shopping_cart/controller/fetch_products.dart';
import 'package:shopping_cart/models/product.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> productList = [
    Product(
        productID: 999,
        productName: 'Loading..',
        productDescription: 'Loading....',
        productThumbnail: 'https://i.ibb.co/jJNKtyS/loading.jpg')
  ];
  @override
  void initState() {
    super.initState();
    getProducts();
    print('initState: no await but a funtion above uses await');
  }

  getProducts() async {
    productList = await fetchProducts();
    print(productList.runtimeType);

    print('getProducts: await is above');
    print('=======PID ${productList[1].productID}==========');
    print('=======PID ${productList[1].productName}==========');
    print('=======PID ${productList[1].productThumbnail}==========');
    print('=======PID ${productList[1].productDescription}==========');
    setState(() {
      productList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      child: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) => ProductCard(
          product: productList[index],
        ),
      ),
    );
  }
}
