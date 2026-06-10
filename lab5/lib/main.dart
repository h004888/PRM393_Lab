import 'package:lab5/Entity/Product.dart';
import 'package:lab5/ViewModel/ProductService.dart';
import 'package:lab5/Views/Pages/AboutPage.dart';
import 'package:lab5/Views/Pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductService productService = ProductService();
    final List<Product> products = productService.getAllProduct();

    return MaterialApp(
      title: 'Product App',
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(products: products),
        '/about': (context) => const AboutPage(),
      },
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
