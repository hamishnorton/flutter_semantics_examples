import 'package:flutter/material.dart';

class DropdownFormFieldBasic extends StatefulWidget {
  const DropdownFormFieldBasic({Key? key}) : super(key: key);

  // https://www.w3.org/TR/wai-aria-practices-1.2/#combobox
  // Missing Semantics include:
  // Alt + arrow down doesn't open the option list (uses Enter)
  // a label
  // ...tbc...

  // funcationally missing the ability to type to limit selection

  static const List<DropdownMenuItem<String>> options = [
    DropdownMenuItem(child: Text('January'), value: 'January'),
    DropdownMenuItem(child: Text('February'), value: 'February'),
    DropdownMenuItem(child: Text('March'), value: 'March'),
    DropdownMenuItem(child: Text('April'), value: 'April'),
    DropdownMenuItem(child: Text('May'), value: 'May'),
    DropdownMenuItem(child: Text('June'), value: 'June'),
    DropdownMenuItem(child: Text('July'), value: 'July'),
    DropdownMenuItem(child: Text('August'), value: 'August'),
    DropdownMenuItem(child: Text('September'), value: 'September'),
    DropdownMenuItem(child: Text('October'), value: 'October'),
    DropdownMenuItem(child: Text('November'), value: 'November'),
    DropdownMenuItem(child: Text('December'), value: 'December'),
  ];

  @override
  State<DropdownFormFieldBasic> createState() => _DropdownFormFieldBasicState();
}

class _DropdownFormFieldBasicState extends State<DropdownFormFieldBasic> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        value: _selectedValue,
        items: DropdownFormFieldBasic.options,
        onChanged: (String? optionValue) {
          print('selected: $optionValue');
          setState(() {
            _selectedValue = optionValue;
          });
        });
  }
}
