import 'package:flutter/material.dart';

class AutoCompleteBasic extends StatelessWidget {
  const AutoCompleteBasic({Key? key}) : super(key: key);

  // https://www.w3.org/TR/wai-aria-practices-1.2/#combobox
  // Missing Semantics include:
  // announcing value selected
  // a label
  // announcing the options available

  static const List<String> _kOptions = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
          // return the full list to show the options immediately
        }
        return _kOptions.where((String option) {
          // match on containing
          // return option
          //     .toLowerCase()
          //     .contains(textEditingValue.text.toLowerCase());

          // match on starts with
          return option
              .toLowerCase()
              .startsWith(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
    );
  }
}
