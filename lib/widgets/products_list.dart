import 'package:flutter/material.dart';
import 'package:teste_estagio/controller/sell_controller.dart';
import 'package:teste_estagio/themes/text_styles.dart';

import 'list_item.dart';

class ProductsList extends StatelessWidget {
  final SellController sellController;
  final String? label;

  ProductsList({required this.sellController, this.label});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label ?? '',
          style: TextStyles.title,
        ),
        SizedBox(
          height: 10,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 200),
          child: Container(
            height: size.height * 0.2,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                CustomListItem(
                  textStyle: TextStyles.productsList,
                  items: [
                    'Produto',
                    'Quantidade',
                    'Valor Unitário',
                    'Valor Total'
                  ],
                ),
                for (var item in sellController.sell.items)
                  CustomListItem(items: [
                    item.name,
                    item.quantity.toString() + "x",
                    "R\$ " + item.price.toStringAsFixed(2).replaceAll('.', ','),
                    "R\$ " +
                        (item.price * item.quantity)
                            .toStringAsFixed(2)
                            .replaceAll('.', ','),
                  ])
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'TOTAL R\$',
                    style: TextStyles.title,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    sellController
                        .getTotalPrice()
                        .toStringAsFixed(2)
                        .replaceAll('.', ','),
                    style: TextStyles.title,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
