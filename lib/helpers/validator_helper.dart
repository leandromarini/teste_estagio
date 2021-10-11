class ValidatorHelper {
  static String? isValidText(String? text) {
    if (text!.isEmpty) return 'Campo obrigatório';
    return null;
  }

  static String? isValidDate(String? date) {
    RegExp regExp = RegExp('^[0-9]{2}[/][0-9]{2}[/][0-9]{4}\$');
    if (!regExp.hasMatch(date!)) return 'Data inválida';

    return null;
  }

  static String? isValidDouble(String? value) {
    if (double.tryParse(value!.replaceAll(',', '.')) == null)
      return 'Número inválido';
  }

  static String? isValidInt(String? value) {
    if (int.tryParse(value!) == null) return 'Número inválido';
  }
}
