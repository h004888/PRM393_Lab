import 'package:flutter/material.dart';

import '../Widgets/Product_Widget.dart';

class HometabPage extends StatefulWidget {
  const HometabPage({super.key});

  @override
  State<HometabPage> createState() => _HometabPageState();
}

class _HometabPageState extends State<HometabPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              alignment: Alignment.topRight,
              label: const Text("1"),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.details)),
            Tab(icon: Icon(Icons.account_box_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProductListWidget(),
          ProductListWidget(),
          const Center(child: Text("About Author")),
        ],
      ),
    );
  }
}
