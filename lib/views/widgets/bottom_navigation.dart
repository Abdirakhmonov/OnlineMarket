import 'package:flutter/material.dart';

import 'card_in_products.dart';

class BottomNavigationElements extends StatefulWidget {
  const BottomNavigationElements({super.key});

  @override
  State<BottomNavigationElements> createState() =>
      _BottomNavigationElementsState();
}

class _BottomNavigationElementsState extends State<BottomNavigationElements> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return const CardInProducts();
                });
          },
          child: Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Text(
              "ADD TO CART",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.lightGreen),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  alignment: Alignment.center,
                  child: const Text(
                    "1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
