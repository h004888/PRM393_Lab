class Product {
  final int id;
  final String name;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  static List<Product> products = [
    Product(id: 1, name: 'Laptop', image: 'laptop.png', price: 1500.0),
    Product(id: 2, name: 'Phone', image: 'phone.png', price: 800.0),
    Product(id: 3, name: 'Tablet', image: 'tablet.png', price: 600.0),
    Product(id: 4, name: 'Watch', image: 'watch.png', price: 300.0),
    Product(id: 5, name: 'Headphones', image: 'headphones.png', price: 150.0),
  ];

  static void add(Product product) {
    products.add(product);
  }

  static void edit(Product product) {
    int index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index] = product;
    }
  }

  static List<Product> searchByName(String name) {
    return products.where((p) => p.name.toLowerCase().contains(name.toLowerCase())).toList();
  }

  static Product? findById(int id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  static List<Product> increasePrice() {
    return products.map((p) => Product(
      id: p.id,
      name: p.name,
      image: p.image,
      price: p.price * 1.1,
    )).toList();
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, image: $image, price: $price)';
  }
}