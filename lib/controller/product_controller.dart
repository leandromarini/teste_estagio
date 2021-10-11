import 'package:teste_estagio/helpers/parse_helper.dart';
import 'package:teste_estagio/model/product_model.dart';

class ProductController {
  Product product = Product();

  setProductName(String? name) {
    product.name = name!;
  }

  setProductPrice(String? price) {
    product.price = ParseHelper.toDouble(price!);
  }

  setProductQuantity(String? quantity) {
    product.quantity = ParseHelper.toDouble(quantity!);
  }
}
