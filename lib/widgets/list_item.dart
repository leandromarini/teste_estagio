import 'package:flutter/material.dart';
import 'package:teste_estagio/themes/text_styles.dart';

class CustomListItem extends StatelessWidget {
  final List<String> items;
  final TextStyle? textStyle;

  CustomListItem({required this.items, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (var i = 0; i < items.length; i++)
              Expanded(
                child: Text(
                  items[i],
                  style: textStyle ?? TextStyles.label,
                ),
              ),
          ],
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
