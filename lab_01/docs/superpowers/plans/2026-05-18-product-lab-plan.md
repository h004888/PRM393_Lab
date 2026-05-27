# Lab 1: Product Class Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Xây dựng class Product với CRUD operations và menu CLI tương tác

**Architecture:** Class Product chứa danh sách tĩnh `products`, các static methods thao tác trên danh sách. File `main.dart` chứa loop chọn chức năng từ console.

**Tech Stack:** Dart core (không Flutter), dart:io cho stdin

---

### Task 1: Tạo Product Model

**Files:**
- Create: `lib/models/product.dart`

- [ ] **Step 1: Viết code Product class**

```dart
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
```

- [ ] **Step 2: Kiểm tra syntax**

Run: `dart analyze lib/models/product.dart`
Expected: No issues

---

### Task 2: Viết Menu CLI trong main.dart

**Files:**
- Modify: `lib/main.dart`

- [ ] **Step 1: Viết code main.dart với menu**

```dart
import 'dart:io';
import 'models/product.dart';

void main() {
  while (true) {
    print('\n=== MENU ===');
    print('1. Hien thi danh sach san pham');
    print('2. Them san pham moi');
    print('3. Sua san pham');
    print('4. Tim kiem theo ten');
    print('5. Tim theo id');
    print('6. Tang gia 10%');
    print('0. Thoat');
    print('Nhap lua chon: ');

    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? '');

    switch (choice) {
      case 1:
        displayProducts();
        break;
      case 2:
        addProduct();
        break;
      case 3:
        editProduct();
        break;
      case 4:
        searchByName();
        break;
      case 5:
        findById();
        break;
      case 6:
        increasePrice();
        break;
      case 0:
        print('Ket thuc!');
        return;
      default:
        print('Lua chon khong hop le!');
    }
  }
}

void displayProducts() {
  if (Product.products.isEmpty) {
    print('Danh sach trong!');
    return;
  }
  for (var p in Product.products) {
    print('${p.id} - ${p.name} - ${p.image} - \$${p.price}');
  }
}

void addProduct() {
  print('Nhap id: ');
  int id = int.parse(stdin.readLineSync()!);
  print('Nhap ten: ');
  String name = stdin.readLineSync()!;
  print('Nhap image: ');
  String image = stdin.readLineSync()!;
  print('Nhap gia: ');
  double price = double.parse(stdin.readLineSync()!);

  Product.add(Product(id: id, name: name, image: image, price: price));
  print('Da them san pham!');
}

void editProduct() {
  print('Nhap id san pham can sua: ');
  int id = int.parse(stdin.readLineSync()!);
  Product? existing = Product.findById(id);
  if (existing == null) {
    print('Khong tim thay san pham!');
    return;
  }

  print('Nhap ten moi (hien tai: ${existing.name}): ');
  String name = stdin.readLineSync()!;
  print('Nhap image moi (hien tai: ${existing.image}): ');
  String image = stdin.readLineSync()!;
  print('Nhap gia moi (hien tai: ${existing.price}): ');
  double price = double.parse(stdin.readLineSync()!);

  Product.edit(Product(id: id, name: name, image: image, price: price));
  print('Da sua san pham!');
}

void searchByName() {
  print('Nhap ten can tim: ');
  String name = stdin.readLineSync()!;
  var results = Product.searchByName(name);
  if (results.isEmpty) {
    print('Khong tim thay san pham nao!');
  } else {
    for (var p in results) {
      print('${p.id} - ${p.name} - ${p.image} - \$${p.price}');
    }
  }
}

void findById() {
  print('Nhap id can tim: ');
  int id = int.parse(stdin.readLineSync()!);
  var product = Product.findById(id);
  if (product == null) {
    print('Khong tim thay san pham!');
  } else {
    print('${product.id} - ${product.name} - ${product.image} - \$${product.price}');
  }
}

void increasePrice() {
  var increased = Product.increasePrice();
  print('Danh sach sau khi tang gia 10%:');
  for (var p in increased) {
    print('${p.id} - ${p.name} - \$${p.price.toStringAsFixed(2)}');
  }
}
```

- [ ] **Step 2: Kiểm tra toàn bộ project**

Run: `dart analyze lib/`
Expected: No issues

- [ ] **Step 3: Chạy thử**

Run: `dart run lib/main.dart`
Expected: Menu hiển thị, các chức năng hoạt động