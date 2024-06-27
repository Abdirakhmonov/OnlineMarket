
class Product {
  String productName;
  double price;
  List<String> imgs;
  String description;
  bool isFavorite = false;

  Product(
      {required this.productName,
        required this.price,
        required this.imgs,
        required this.description});
}
