import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/product_description.dart';
import '../widgets/rating.dart';
import '../widgets/show_img.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Product product = Product(
      productName: 'Table Desk Lamp Light',
      price: 140,
      imgs: [
        "https://i.pinimg.com/736x/69/86/4b/69864b4667f4d2fe121a44360977dfdd.jpg",
        "https://a66.ru/galleries/9625/03.png",
        "https://cdn4.iconfinder.com/data/icons/light-source-4/500/d392_2_lamp_table_cartoon_object_equipment_office_desk-1024.png"
      ],
      description:
          'Elevate your workspace with our Sleek and Modern Desk Lamp. This elegant lighting solution combines functionality with style, making it perfect for any home office, study area, or bedside table.');

  int selectImg = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        actions: [
          const Icon(
            Icons.share,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ShowImg(imgUrl: product.imgs[selectImg]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: Text(
                                product.productName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          const Text(
                            'Price',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          // SizedBox(height: 10,),
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.greenAccent),
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Choose img!",
                            style: TextStyle(fontSize: 16),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              for (int i = 0; i < product.imgs.length; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectImg = i;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              Random().nextInt(255),
                                              Random().nextInt(255),
                                              Random().nextInt(255),
                                              100),
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Rating(),
              const SizedBox(
                height: 30,
              ),
              ProductDescription(
                  productName: product.productName,
                  productDescriptionn: product.description),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: product.isFavorite
                            ? Colors.green
                            : Colors.grey.shade300,
                        shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          product.isFavorite = !product.isFavorite;
                        });
                      },
                      icon: product.isFavorite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 40,
                            )
                          : const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 40,
                            ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: BottomNavigationElements()),
    );
  }
}
