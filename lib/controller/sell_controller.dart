import 'package:teste_estagio/helpers/parse_helper.dart';
import 'package:teste_estagio/model/product_model.dart';
import 'package:teste_estagio/model/sell_model.dart';

class SellController {
  Sell sell = Sell();

  addItem(Product product) {
    sell.items.add(product);
  }

  setSellId(String? value) {
    sell.id = ParseHelper.toInt(value!);
  }

  setSellDate(String? date) {
    sell.date = date!;
  }

  setSellClientName(String? clientName) {
    sell.clientName = clientName!;
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var i = 0; i < sell.items.length; i++) {
      totalPrice += sell.items[i].price * sell.items[i].quantity;
    }

    return totalPrice;
  }
}
