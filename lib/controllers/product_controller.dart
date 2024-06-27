import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductController extends ChangeNotifier {
  final List<ProductModel> _list = [
    ProductModel(
      id: "1",
      title: "Table Desk Lampochka",
      subtitle: "Lamp",
      price: 142.00,
      rating: "(4.2)",
    ),
    ProductModel(
      id: "2",
      title: "Wooden Chair",
      subtitle: "Chair",
      price: 85.00,
      rating: "(4.5)",
    ),
    ProductModel(
      id: "3",
      title: "Comfort Sofa",
      subtitle: "Sofa",
      price: 320.00,
      rating: "(4.7)",
    ),
    ProductModel(
      id: "4",
      title: "Modern Coffee Table",
      subtitle: "Table",
      price: 190.00,
      rating: "(4.3)",
    ),
    ProductModel(
      id: "5",
      title: "Stylish Bookshelf",
      subtitle: "Bookshelf",
      price: 210.00,
      rating: "(4.6)",
    ),
    ProductModel(
      id: "6",
      title: "Kitchen Cabinet",
      subtitle: "Cabinet",
      price: 450.00,
      rating: "(4.4)",
    ),
    ProductModel(
      id: "7",
      title: "Wall Art Picture",
      subtitle: "Art",
      price: 120.00,
      rating: "(4.8)",
    ),
    ProductModel(
      id: "8",
      title: "Office Desk",
      subtitle: "Desk",
      price: 275.00,
      rating: "(4.5)",
    ),
    ProductModel(
      id: "9",
      title: "Outdoor Patio Set",
      subtitle: "Patio",
      price: 650.00,
      rating: "(4.7)",
    ),
    ProductModel(
      id: "10",
      title: "Bed Frame",
      subtitle: "Bed",
      price: 350.00,
      rating: "(4.6)",
    ),
    ProductModel(
      id: "11",
      title: "Dining Table",
      subtitle: "Table",
      price: 480.00,
      rating: "(4.5)",
    ),
    ProductModel(
      id: "12",
      title: "Leather Recliner",
      subtitle: "Recliner",
      price: 550.00,
      rating: "(4.7)",
    ),
    ProductModel(
      id: "13",
      title: "Nightstand",
      subtitle: "Nightstand",
      price: 130.00,
      rating: "(4.4)",
    ),
    ProductModel(
      id: "14",
      title: "Floor Lamp",
      subtitle: "Lamp",
      price: 180.00,
      rating: "(4.3)",
    ),
    ProductModel(
      id: "15",
      title: "Dresser",
      subtitle: "Dresser",
      price: 300.00,
      rating: "(4.5)",
    ),
    ProductModel(
      id: "16",
      title: "Area Rug",
      subtitle: "Rug",
      price: 200.00,
      rating: "(4.6)",
    ),
    ProductModel(
      id: "17",
      title: "Wall Clock",
      subtitle: "Clock",
      price: 95.00,
      rating: "(4.7)",
    ),
    ProductModel(
      id: "18",
      title: "Ceiling Fan",
      subtitle: "Fan",
      price: 220.00,
      rating: "(4.4)",
    ),
    ProductModel(
      id: "19",
      title: "TV Stand",
      subtitle: "Stand",
      price: 270.00,
      rating: "(4.5)",
    ),
    ProductModel(
      id: "20",
      title: "Bookshelf",
      subtitle: "Bookshelf",
      price: 300.00,
      rating: "(4.8)",
    ),
  ];

  List<ProductModel> get list => _list;
}
