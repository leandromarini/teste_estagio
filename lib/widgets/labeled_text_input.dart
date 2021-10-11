import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:teste_estagio/themes/text_styles.dart';

class LabeledTextInput extends StatefulWidget {
  final String text;
  final double width;

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  final TextInputFormatter mask;

  LabeledTextInput({
    required this.text,
    required this.width,
    required this.onSaved,
    required this.validator,
    required this.mask,
  });

  @override
  _LabeledTextInputState createState() => _LabeledTextInputState();
}

class _LabeledTextInputState extends State<LabeledTextInput> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyles.label,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: widget.width,
            height: 60,
            child: TextFormField(
              inputFormatters: [widget.mask],
              style: TextStyles.label,
              decoration: InputDecoration(
                helperText: '',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.zero,
                ),
              ),
              textAlignVertical: TextAlignVertical.center,
              onSaved: widget.onSaved,
              controller: controller,
              validator: widget.validator,
            ),
          ),
        ],
      ),
    );
  }
}
