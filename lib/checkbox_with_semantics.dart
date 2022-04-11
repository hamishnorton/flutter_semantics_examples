import 'package:flutter/material.dart';

class CheckboxWithSemantics extends StatefulWidget {
  const CheckboxWithSemantics({Key? key}) : super(key: key);

  @override
  State<CheckboxWithSemantics> createState() => _CheckboxWithSemanticsState();
}

class _CheckboxWithSemanticsState extends State<CheckboxWithSemantics> {
  bool value = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {
    print('checkboxWithSemanticsState.build() value: $value');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('CheckboxListTile'),
            value: value,
            onChanged: (v) {
              print('CheckboxListTile.onChanged()');
              print('value: $value');
              print('v: $v');
              setState(() {
                value = (v ?? false);
                print('value: $value');
              });
            }),

        Row(
          children: [
            Checkbox(
                value: value2,
                onChanged: (v) {
                  print('Checkbox.onChanged()');
                  print('value: $value2');
                  print('v: $v');
                  setState(() {
                    value2 = (v ?? false);
                    print('value: $value2');
                  });
                }),
            const Text('CheckBox Label'),
          ],
        ),
        CheckboxListTile(
            title: Text('CheckboxListTile'),
            value: value,
            onChanged: (v) {
              print('CheckboxListTile.onChanged()');
              print('value: $value');
              print('v: $v');
              setState(() {
                value = (v ?? false);
                print('value: $value');
              });
            }),
        // if (value == null || value == false)
        //   const Text(
        //     'validation message',
        //     style: TextStyle(color: Colors.red),
        //   )
      ],
    );
  }
}
