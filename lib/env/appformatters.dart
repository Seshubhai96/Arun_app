import 'package:arunmall/env/appexports.dart';
class NoLeadingTrailingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Remove leading and trailing spaces
    newText = newText.trimLeft();

    // Update cursor position
    int newSelectionIndex = newValue.selection.baseOffset;
    if (newSelectionIndex > newText.length) {
      newSelectionIndex = newText.length;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newSelectionIndex),
    );
  }
}
class AlphabetTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Using a regular expression to allow only alphabets
    final String newText = newValue.text;
    if (RegExp(r'^[a-zA-Z]*$').hasMatch(newText)) {
      return newValue;
    }
    return oldValue;  // Ignore the update if it contains non-alphabet characters
  }
}

class Digitformmater extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // log(oldValue.text);
    // log(newValue.text);
    String newText = newValue.text;
    String lastChar = newText.substring(newText.length - 1);  
    if ((int.tryParse(lastChar) != null)) {
      int newSelectionIndex = newValue.selection.baseOffset;
      if (newSelectionIndex > newText.length) {
        newSelectionIndex = newText.length;
      }
      return TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: newSelectionIndex));
    } else {
      int oldselectionIndex = oldValue.selection.baseOffset;
      if (oldselectionIndex > oldValue.text.length) {
        oldselectionIndex = oldValue.text.length;
      }
      return TextEditingValue(
          text: oldValue.text,
          selection: TextSelection.collapsed(offset: oldselectionIndex));
    }
  }
}