import 'package:flutter/material.dart';
import 'package:online_market/views/screens/home_screen.dart';
import 'package:online_market/views/screens/payment.dart';
import 'package:provider/provider.dart';
import 'controllers/cart_controller.dart';
import 'controllers/product_controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
