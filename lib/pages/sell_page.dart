import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teste_estagio/controller/product_controller.dart';
import 'package:teste_estagio/controller/sell_controller.dart';
import 'package:teste_estagio/helpers/validator_helper.dart';
import 'package:teste_estagio/model/product_model.dart';
import 'package:teste_estagio/widgets/custom_button.dart';
import 'package:teste_estagio/widgets/labeled_text_input.dart';
import 'package:teste_estagio/widgets/products_list.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final _productKey = GlobalKey<FormState>();
  final _sellKey = GlobalKey<FormState>();

  final ProductController productController = ProductController();
  final SellController sellController = SellController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: _buildForm(size),
      ),
    );
  }

  _buildForm(size) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 700, maxWidth: 1000),
        child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            height: 600,
            width: size.width * 0.7,
            child: LayoutBuilder(builder: (_, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSellInputsRow(constraints),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  _buildProductInputsRow(constraints),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ProductsList(
                    sellController: sellController,
                    label: 'Itens',
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  _buildBottomButtons(),
                ],
              );
            })),
      ),
    );
  }

  _buildSellInputsRow(constraints) {
    return Form(
      key: _sellKey,
      child: Row(
        children: [
          LabeledTextInput(
            width: constraints.maxWidth * 0.2,
            text: 'Número',
            onSaved: sellController.setSellId,
            validator: ValidatorHelper.isValidInt,
            mask: MaskTextInputFormatter(),
          ),
          SizedBox(
            width: constraints.maxWidth * 0.03,
          ),
          LabeledTextInput(
            width: constraints.maxWidth * 0.2,
            text: 'Data',
            onSaved: sellController.setSellDate,
            validator: ValidatorHelper.isValidDate,
            mask: MaskTextInputFormatter(
              mask: '##/##/####',
              filter: {
                '#': RegExp('[0-9]'),
              },
            ),
          ),
          SizedBox(
            width: constraints.maxWidth * 0.03,
          ),
          LabeledTextInput(
            width: constraints.maxWidth * 0.35,
            text: 'Nome do cliente',
            onSaved: sellController.setSellClientName,
            validator: ValidatorHelper.isValidText,
            mask: MaskTextInputFormatter(),
          ),
        ],
      ),
    );
  }

  _buildProductInputsRow(constraints) {
    return Form(
      key: _productKey,
      child: Row(
        children: [
          LabeledTextInput(
            width: constraints.maxWidth * 0.35,
            text: 'Produto',
            onSaved: productController.setProductName,
            validator: ValidatorHelper.isValidText,
            mask: MaskTextInputFormatter(),
          ),
          SizedBox(
            width: constraints.maxWidth * 0.03,
          ),
          LabeledTextInput(
            width: constraints.maxWidth * 0.15,
            text: 'Quantidade',
            onSaved: productController.setProductQuantity,
            validator: ValidatorHelper.isValidInt,
            mask: MaskTextInputFormatter(),
          ),
          SizedBox(
            width: constraints.maxWidth * 0.03,
          ),
          LabeledTextInput(
            width: constraints.maxWidth * 0.25,
            text: 'Valor unitário',
            onSaved: productController.setProductPrice,
            validator: ValidatorHelper.isValidDouble,
            mask: MaskTextInputFormatter(),
          ),
          SizedBox(
            width: constraints.maxWidth * 0.03,
          ),
          Expanded(
            child: CustomButton(
              text: 'Inserir Item',
              onPressed: () {
                if (_productKey.currentState!.validate()) {
                  _productKey.currentState!.save();

                  setState(() {
                    sellController.addItem(productController.product);
                  });
                  _productKey.currentState!.reset();

                  productController.product = Product();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomButtons() {
    return Row(
      children: [
        CustomButton(
          text: 'Imprimir',
          onPressed: () {
            if (_sellKey.currentState!.validate()) {
              _sellKey.currentState!.save();
              Navigator.pushNamed(context, '/printPage',
                  arguments: sellController);
            }
          },
        ),
        SizedBox(
          width: 20,
        ),
        CustomButton(
          text: 'Limpar',
          onPressed: () {
            setState(() {
              sellController.sell.items.clear();
            });
          },
        )
      ],
    );
  }
}
