import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/product_controller.dart';
import '../../utils/app_constants.dart';
import '../widgets/cont1.dart';
import '../widgets/custom_scroll.dart';
import '../widgets/product_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _popUpMenuVal = 'Sort by';
  int _tappedIndex = -1;

  void _handleTap(int index) {
    _tappedIndex = index;
    setState(() {});
  }

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
    ProductController productController =
        Provider.of<ProductController>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 25,
              )),
          CircleAvatar(
            radius: 15,
            child: Image.asset("assets/images/profile.png"),
          )
        ],
      ),
      body: Column(
        children: [
          Cont1Widget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
              height: 45,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: AppConstants.customScrollWidgetValues.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          CustomScrollWidget(
                        buttonText:
                            AppConstants.customScrollWidgetValues[index],
                        index: index,
                        tappedIndex: _tappedIndex,
                        onTap: _handleTap,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Have ${productController.list.length} products',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                PopupMenuButton<String>(
                  color: Colors.white,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                    _sortTexts(result, productController);
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
          Expanded(
            child: ProductCard(
              productController: productController,
              isSelected: false,
            ),
          )
        ],
      ),
    );
  }
}
