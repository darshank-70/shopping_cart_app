import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final int productID;

  @HiveField(1)
  final String productName;

  @HiveField(2)
  String productDescription;

  @HiveField(3)
  String productThumbnail;

  @HiveField(4)
  double productPrice;
  Product({
    required this.productID,
    required this.productName,
    required this.productDescription,
    required this.productThumbnail,
    required this.productPrice,
  });
}
