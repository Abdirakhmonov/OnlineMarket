import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../controllers/product_controller.dart';
import '../widgets/product_cart.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String _popUpMenuVal = 'Sort by';

  void _sortTexts(String criterion, ProductController productController) {
    if (criterion == 'A-Z') {
      productController.list.sort((a, b) => a.title.compareTo(b.title));
    } else if (criterion == 'Z-A') {
      productController.list.sort((a, b) => b.title.compareTo(a.title));
    } else if (criterion == 'Price') {
      productController.list.sort((a, b) => b.price.compareTo(a.price));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ProductController _productController =
        Provider.of<ProductController>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://images.squarespace-cdn.com/content/v1/63e70128412db810be70533a/cace1682-b1d0-492b-b2ba-757804e7bfdc/HangingWallArt-FeatureImage.png?format=2500w",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Have ${_productController.list.length} products',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  PopupMenuButton<String>(
                    color: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F6F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            _popUpMenuVal,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                        ],
                      ),
                    ),
                    onSelected: (String result) {
                      _popUpMenuVal = result;
                      _sortTexts(result, _productController);
                      setState(() {});
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'A-Z',
                        child: Text('A-Z'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Z-A',
                        child: Text('Z-A'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Price',
                        child: Text('Price'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: ProductCard(
              productController: _productController,
              isSelected: true,
            ),
          ),
        ],
      ),
    );
  }
}
