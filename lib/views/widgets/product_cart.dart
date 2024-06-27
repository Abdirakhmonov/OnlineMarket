import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductController productController;
  final bool isSelected;
  const ProductCard(
      {super.key, required this.productController, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? SliverGrid.builder(
            itemCount: productController.list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10.0,
                mainAxisExtent: 250),
            itemBuilder: (context, index) {
              final product = productController.list[index];
              return cardWidget(product);
            },
          )
        : GridView.builder(
            itemCount: productController.list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10.0,
                mainAxisExtent: 250),
            itemBuilder: (context, index) {
              final product = productController.list[index];
              return cardWidget(product);
            },
          );
  }

  Widget cardWidget(ProductModel product) => Card(
        color: const Color.fromARGB(255, 199, 213, 224),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https://i.ebayimg.com/thumbs/images/g/~YkAAOSwupJkwKKb/s-l960.webp",
                    width: 100,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                      ),
                      Text(
                        product.rating,
                        style: TextStyle(
                          color: Colors.yellow.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                product.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                product.subtitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}.00",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff0A982F),
                    ),
                  ),
                  IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xff0A982F),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
