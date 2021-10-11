import 'package:flutter/material.dart';
import 'package:teste_estagio/controller/sell_controller.dart';
import 'package:teste_estagio/helpers/datetime_helper.dart';
import 'package:teste_estagio/themes/text_styles.dart';
import 'package:teste_estagio/widgets/products_list.dart';

class PrintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as SellController;

    return Scaffold(
      body: _buildPrintMessage(size, args),
    );
  }

  _buildPrintMessage(size, args) {
    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 700, maxWidth: 1000),
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: 600,
            width: size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Devi Tecnologia',
                  style: TextStyles.title,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  'Venda #' + args.sell.id.toString(),
                  style: TextStyles.subtitle,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Data: ' + args.sell.date),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text('Nome do cliente: ' + args.sell.clientName),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      ProductsList(sellController: args)
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Column(
                  children: [
                    Text(
                      'Obrigado e volte sempre!',
                      style: TextStyles.message,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Gerado em ' +
                                DateTimeHelper.day +
                                '/' +
                                DateTimeHelper.month +
                                '/' +
                                DateTimeHelper.year +
                                ' ',
                            style: TextStyles.timeStamp),
                        Text(
                            DateTimeHelper.hour +
                                ':' +
                                DateTimeHelper.minute +
                                ':' +
                                DateTimeHelper.second,
                            style: TextStyles.timeStamp),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
