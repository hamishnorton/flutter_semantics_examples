import 'package:flutter/material.dart';

class CheckboxWithSemantics extends StatefulWidget {
  const CheckboxWithSemantics({Key? key}) : super(key: key);

  @override
  State<CheckboxWithSemantics> createState() => _CheckboxWithSemanticsState();
}

class _CheckboxWithSemanticsState extends State<CheckboxWithSemantics> {
  bool? value;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        liveRegion: true,
        container: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                    value: value ?? false,
                    onChanged: (v) {
                      print('value: $value');
                      print('v: $v');
                      setState(() {
                        value = v;
                        print('value: $value');
                      });
                    }),
                const Text('CheckBox Label'),
              ],
            ),
            if (value == null || value == false)
              const Text(
                'validation message',
                style: TextStyle(color: Colors.red),
              )
          ],
        ),
      ),
    );
  }
}
