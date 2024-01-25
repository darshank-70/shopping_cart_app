import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_cart/constants.dart';
import 'package:shopping_cart/models/product.dart';

fetchProducts() async {
  List productMapInList;
  List<Product> productObjects = [];

  http.Response response =
      await http.get(Uri.parse('$PRODUCTS_ENDPOINT?limit=7'));
  String responseData = response.body;
  //this MAP has products[],total,limit,skip :KEYS
  var mapOfData = jsonDecode(responseData);
//this below is List<> i only need products[Map<>]

  productMapInList = mapOfData['products'];
  // print('+++++++++++${productMapInList} ++++++++++++');

  productObjects = createProductObject(productMapInList, productObjects);
  return productObjects;
}

List<Product> createProductObject(productMapInList, productObjects) {
  //productMapInList has n number of Map<> which is each product
  for (var item in productMapInList) {
    var temp = Product(
      productID: item['id'],
      productName: item['title'],
      productDescription: item['description'],
      productThumbnail: item['thumbnail'],
    );
    productObjects.add(temp);
  }
  return productObjects;
}
// createPro

//  print('=+++++++++${xyz.runtimeType} +++++++++++');
//   print(xyz['products'].runtimeType);
//   print(xyz['products'].length);
//   print('###');
//   print(xyz['products'][0]['title']);
//   print('###');