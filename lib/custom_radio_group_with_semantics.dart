import 'package:flutter/material.dart';
import 'package:flutter_semantics_examples/extensions/material_state_property_extensions.dart';

class CustomRadioGroupWithSemanticsWrapper extends StatefulWidget {
  const CustomRadioGroupWithSemanticsWrapper({Key? key}) : super(key: key);

  @override
  State<CustomRadioGroupWithSemanticsWrapper> createState() =>
      _CustomRadioGroupWithSemanticsWrapperState();
}

class _CustomRadioGroupWithSemanticsWrapperState
    extends State<CustomRadioGroupWithSemanticsWrapper> {
  bool? isYes;

  @override
  Widget build(BuildContext context) {
    return CustomRadioGroupWithSemantics.yesNo(
        label: 'Is this useful',
        groupValue: isYes,
        onChanged: (newValue) {
          print('newValue: $newValue');
          setState(() {
            isYes = newValue;
          });
          print('isYes: $isYes');
        });
  }
}

class CustomRadioGroupWithSemantics<T> extends StatelessWidget {
  const CustomRadioGroupWithSemantics({
    Key? key,
    required this.label,
    required this.options,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final List<Option<T>> options;
  final T? groupValue;
  final ValueChanged<T> onChanged;

  static CustomRadioGroupWithSemantics<bool> yesNo({
    required String label,
    required bool? groupValue,
    required ValueChanged<bool> onChanged,
  }) {
    return CustomRadioGroupWithSemantics(
      options: const [
        Option(text: "Yes", value: true),
        Option(text: "No", value: false),
      ],
      label: label,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      liveRegion: true,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label),
        Row(
          children: options.map((o) {
            return Expanded(
              child: CustomRadioGroupButton(
                label: o.text,
                isSelected: (o.value == groupValue),
                onPressed: () => onChanged(o.value),
              ),
            );
          }).toList(),
        ),
        if (groupValue == true) const Text('validationMessage'),
      ]),
    );
  }
}

class Option<T> {
  final T value;
  final String text;

  const Option({required this.text, required this.value});
}

class CustomRadioGroupButton extends StatelessWidget {
  const CustomRadioGroupButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        checked: isSelected,
        inMutuallyExclusiveGroup: true,
        child: OutlinedButton(
          style: (isSelected) ? selectedRadioStyle : defaultRadioStyle,
          onPressed: onPressed,
          child: Text(label),
        ),
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    Key? key,
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final int groupValue;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        checked: (value == groupValue),
        inMutuallyExclusiveGroup: true,
        child: OutlinedButton(
          style: (value == groupValue) ? selectedRadioStyle : defaultRadioStyle,
          onPressed: () {
            onChanged(value);
          },
          child: Text(label),
        ),
      ),
    );
  }
}

final defaultRadioStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyX.when<Color>(
    normal: Colors.white,
    hovered: Colors.grey,
    pressed: (normal) => Colors.black,
    disabled: (normal) => normal.withOpacity(0.3),
  ),
  foregroundColor: MaterialStatePropertyX.when<Color>(
    normal: Colors.black,
    disabled: (normal) => normal.withOpacity(0.4),
  ),
  side: MaterialStatePropertyX.when(
    normal: const BorderSide(color: Colors.indigo, width: 1.0),
    focused: const BorderSide(color: Colors.black, width: 2.0),
  ),
  shape: MaterialStatePropertyX.when(
    normal: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);

final selectedRadioStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyX.when<Color>(
    normal: Colors.indigo,
    hovered: Colors.grey,
    pressed: (normal) => Colors.black,
    disabled: (normal) => normal.withOpacity(0.3),
  ),
  foregroundColor: MaterialStatePropertyX.when<Color>(
    normal: Colors.white,
    disabled: (normal) => normal.withOpacity(0.4),
  ),
  side: MaterialStatePropertyX.when(
    normal: const BorderSide(color: Colors.indigo, width: 1.0),
    focused: const BorderSide(color: Colors.black, width: 2.0),
  ),
  shape: MaterialStatePropertyX.when(
    normal: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);
