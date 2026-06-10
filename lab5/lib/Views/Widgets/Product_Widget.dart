import 'package:lab5/Entity/Product.dart';
import 'package:flutter/material.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({super.key});
  final List<Product> products = Product.products;

  @override
  Widget build(BuildContext context) {
    return ReponsiveProduct(products: products);
  }
}

class ReponsiveProduct extends StatelessWidget {
  final List<Product> products;
  ReponsiveProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width < 450 ? 1 : 2,
      children: products
          .map((product) => ProductWidget(product: product))
          .toList(),
    );
  }
}

class OneColumnProduct extends StatelessWidget {
  final List<Product> products;
  OneColumnProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < products.length; i++)
          ProductWidget(product: products[i]),
      ],
    );
  }
}

class ProductWidget extends StatefulWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            // Sort Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: DropdownButton<int>(
                value: _count,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(child: Text("A-Z"), value: 0),
                  DropdownMenuItem(child: Text("Z-A"), value: 1),
                  DropdownMenuItem(child: Text("Low to High"), value: 2),
                  DropdownMenuItem(child: Text("High to Low"), value: 3),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _count = value;
                    });
                  }
                },
              ),
            ),
            // Product Image
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        widget.product.image ?? 'assets/images/dog.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: FloatingActionButton.extended(
                      heroTag: 'cart-${widget.product.id}',
                      onPressed: () {},
                      label: const Text("Add to cart"),
                      icon: const Icon(Icons.shopping_cart),
                    ),
                  ),
                ],
              ),
            ),
            // Product name, price, like
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Product Name: ${widget.product.name}"),
                          Text("Price: ${widget.product.price}\$"),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _count++;
                        });
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    Text(_count.toString()),
                  ],
                ),
              ),
            ),
            // List Icons
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              ),
            ),
            // Product Description
            Expanded(
              flex: 3,
              child: Card(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.product.description,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
