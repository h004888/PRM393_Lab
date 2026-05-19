# Lab 1: Xây dựng lớp Product

## Mục tiêu
Xây dựng class `Product` với các thuộc tính cơ bản và phương thức quản lý danh sách sản phẩm, kèm menu CLI tương tác.

## Thuộc tính (Properties)
| Thuộc tính | Kiểu dữ liệu | Mô tả |
|------------|---------------|-------|
| `id` | `int` | Mã sản phẩm |
| `name` | `String` | Tên sản phẩm |
| `image` | `String` | Đường dẫn ảnh |
| `price` | `double` | Giá sản phẩm |

## Danh sách tĩnh
```dart
static List<Product> products = [ ... ] // 5-7 sản phẩm mẫu
```

## Constructors & Factory
| Method | Mô tả |
|--------|-------|
| `Product({required this.id, required this.name, required this.image, required this.price})` | Constructor thông thường |
| `factory Product.fromJson(Map<String, dynamic> json)` | Map JSON → Product |

## Static Methods
| Method | Mô tả |
|--------|-------|
| `static void add(Product product)` | Thêm sản phẩm vào list |
| `static void edit(Product product)` | Tìm theo `id`, cập nhật name/image/price |
| `static List<Product> searchByName(String name)` | Tìm gần đúng (partial match), không phân biệt hoa thường |
| `static Product? findById(int id)` | Tìm chính xác theo id, trả về `null` nếu không thấy |
| `static List<Product> increasePrice()` | Trả về list mới với giá tăng 10%, list gốc không đổi (dùng `map`) |

## Menu CLI
| Lựa chọn | Chức năng |
|-----------|-----------|
| 1 | Hiển thị danh sách sản phẩm |
| 2 | Thêm sản phẩm mới |
| 3 | Sửa sản phẩm (theo id) |
| 4 | Tìm kiếm theo tên |
| 5 | Tìm theo id |
| 6 | Tăng giá 10% |
| 0 | Thoát |

## Cấu trúc thư mục
```
lib/
├── main.dart           # Entry point + CLI menu
├── models/
│   └── product.dart   # Class Product (đầy đủ methods)
```

## Yêu cầu kỹ thuật
- Dart core (không dùng Flutter, không widget)
- Chạy trên Dart VM (command line)