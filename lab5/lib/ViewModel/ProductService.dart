import 'package:lab5/Entity/Product.dart';
import 'package:lab5/Reposistory/ProductDAO.dart';

class ProductService {
  final ProductDAO _productDAO = ProductDAO();

  List<Product> getAllProduct() {
    return _productDAO.getAllProduct();
  }
}
