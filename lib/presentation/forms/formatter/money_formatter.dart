import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoneyFormatter extends TextInputFormatter {
  final bool allowFraction;
  final int decimalPlaces;
  final bool allowNegative;

  final NumberFormat formatter;

  MoneyFormatter({
    this.allowFraction = false,
    this.decimalPlaces = 2,
    this.allowNegative = false,
    // ignore: prefer_interpolation_to_compose_strings
  }) : formatter = NumberFormat('Rp#,##0.' + '#' * decimalPlaces);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String decimalSeparator = formatter.symbols.DECIMAL_SEP;
    return textManipulation(
      oldValue,
      newValue,
      textInputFormatter: allowFraction
          ? (allowNegative
              ? FilteringTextInputFormatter.allow(
                  RegExp('[0-9-]+([$decimalSeparator])?'))
              : FilteringTextInputFormatter.allow(
                  RegExp('[0-9]+([$decimalSeparator])?')))
          : (allowNegative
              ? FilteringTextInputFormatter.allow(RegExp('[0-9-]+'))
              : FilteringTextInputFormatter.digitsOnly),
      // because FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]+')), does not work
      // https://github.com/flutter/flutter/issues/21874
      formatPattern: (String filteredString) {
        if (allowNegative) {
          // filter negative sign in the middle
          // this will also remove redundant negative signs
          if ('-'.allMatches(filteredString).isNotEmpty) {
            filteredString = (filteredString.startsWith('-') ? '-' : '') +
                filteredString.replaceAll('-', '');
            // print(filteredString);
          }
        }

        if (filteredString.isEmpty) return '';
        num number;
        if (allowFraction) {
          String decimalDigits = filteredString;
          if (decimalSeparator != '.') {
            decimalDigits =
                filteredString.replaceFirst(RegExp(decimalSeparator), '.');
          }
          number = double.tryParse(decimalDigits) ?? 0.0;
        } else {
          number = int.tryParse(filteredString) ?? 0;
        }
        final result = formatter.format(number);
        if (allowFraction && filteredString.endsWith(decimalSeparator)) {
          return '$result$decimalSeparator';
        }

        // Fix the -0. and similar issues
        if (allowNegative) {
          if (allowFraction) {
            if (filteredString == '-' ||
                filteredString == '-0' ||
                filteredString == '-0.') {
              return filteredString;
            }
          }
          if (filteredString == '-') {
            return filteredString;
          }
        }

        // Fix the .0 or .01 or .10 and similar issues
        if (allowFraction && filteredString.contains('.')) {
          List<String> decimalPlacesValue = filteredString.split(".");
          String decimalOnly = decimalPlacesValue[1];
          String decimalTruncated =
              decimalOnly.substring(0, min(decimalPlaces, decimalOnly.length));
          double digitsOnly = double.tryParse(decimalPlacesValue[0]) ?? 0.0;
          String result = formatter.format(digitsOnly);
          result = '$result.$decimalTruncated';
          return result;
        }

        return result;
      },
    );
  }
}

TextEditingValue textManipulation(
  TextEditingValue oldValue,
  TextEditingValue newValue, {
  TextInputFormatter? textInputFormatter,
  // ignore: use_function_type_syntax_for_parameters
  String formatPattern(String filteredString)?,
}) {
  final originalUserInput = newValue.text;

  /// remove all invalid characters
  newValue = textInputFormatter != null
      ? textInputFormatter.formatEditUpdate(oldValue, newValue)
      : newValue; // remove separators?

  /// current selection
  int selectionIndex = newValue.selection.end;

  /// format original string, this step would add some separator characters
  final newText =
      formatPattern != null ? formatPattern(newValue.text) : newValue.text;

  if (newText == newValue.text) {
    return newValue;
  }

  /// count number of inserted character in new string
  int insertCount = 0;

  /// count number of original input character in new string
  int inputCount = 0;

  bool isUserInput(String s) {
    if (textInputFormatter == null) return originalUserInput.contains(s);
    return newValue.text.contains(s);
  }

  for (int i = 0; i < newText.length && inputCount < selectionIndex; i++) {
    final character = newText[i];
    if (isUserInput(character)) {
      inputCount++;
    } else {
      insertCount++;
    }
  }

  /// adjust selection according to number of inserted characters staying before selection
  selectionIndex += insertCount;
  selectionIndex = min(selectionIndex, newText.length);

  /// if selection is right after an inserted character, it should be moved
  /// backward, this adjustment prevents an issue that user cannot delete
  /// characters when cursor stands right after inserted characters
  if (selectionIndex - 1 >= 0 &&
      selectionIndex - 1 < newText.length &&
      !isUserInput(newText[selectionIndex - 1])) {
    selectionIndex--;
  }
  // print('inputCount: $inputCount');
  // print('insertCount: $insertCount');

  return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
      composing: TextRange.empty);
}
