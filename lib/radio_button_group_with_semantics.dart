import 'package:flutter/material.dart';
import 'package:flutter_semantics_examples/custom_radio_group_with_semantics.dart';

class RadioButtonGroupWithSemantics extends StatefulWidget {
  const RadioButtonGroupWithSemantics({Key? key}) : super(key: key);

  @override
  State<RadioButtonGroupWithSemantics> createState() =>
      _RadioButtonGroupWithSemanticsState();
}

class _RadioButtonGroupWithSemanticsState
    extends State<RadioButtonGroupWithSemantics> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Radio question'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Expanded(
            //   child: MergeSemantics(
            //     child: ListTile(
            //       title: const Text('title: 1'),
            //       leading: Radio<int>(
            //         value: 1,
            //         groupValue: _value,
            //         onChanged: (int? value) {
            //           setState(() {
            //             _value = 1;
            //           });
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
                child: CustomRadioButton(
              label: 'title: 4',
              value: 4,
              groupValue: _value,
              onChanged: (int? value) {
                setState(() {
                  _value = 4;
                });
              },
            )),
            Expanded(
              child: RadioListTile<int>(
                title: const Text('title: 2'),
                value: 2,
                groupValue: _value,
                onChanged: (int? value) {
                  setState(() {
                    _value = 2;
                  });
                },
              ),
            ),
            Expanded(
                child: LabeledRadio(
              label: 'title: 3',
              value: 3,
              groupValue: _value,
              onChanged: (int? value) {
                setState(() {
                  _value = 3;
                });
              },
            )),
          ],
        ),
        const Text('validation message'),
      ],
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final int? groupValue;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: InkWell(
        onTap: () {
          if (value != groupValue) {
            onChanged(value);
          }
        },
        child: Row(
          children: <Widget>[
            Radio<int>(
              groupValue: groupValue,
              value: value,
              onChanged: (int? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
