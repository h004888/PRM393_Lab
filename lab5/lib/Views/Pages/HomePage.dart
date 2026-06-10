import 'package:lab5/Entity/Product.dart';
import 'package:lab5/Views/Pages/AboutPage.dart';
import 'package:lab5/Views/Pages/ProductDetailPage.dart';
import 'package:lab5/Views/Widgets/ButtonBar.dart';
import 'package:lab5/Views/Widgets/ProductList.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  final List<Product> products;

  const Homepage({super.key, required this.products});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void openFirstProductDetail() {
    if (widget.products.isEmpty) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: widget.products.first),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.menu),
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            icon: const Icon(Icons.account_box_outlined),
          ),
          IconButton(
            onPressed: widget.products.isEmpty ? null : openFirstProductDetail,
            icon: const Icon(Icons.details),
          ),
        ],
      ),
      body: [
        ProductListReponsive(products: widget.products),
        const Center(child: Text('Detail product')),
        const Center(child: Text('About')),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.details), label: 'Detail'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
