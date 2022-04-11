import 'package:flutter/material.dart';
import 'package:flutter_semantics_examples/buttons_with_semantics/valication_button.dart';

class ButtonsWithSemantics extends StatefulWidget {
  const ButtonsWithSemantics({Key? key}) : super(key: key);

  @override
  State<ButtonsWithSemantics> createState() => _ButtonsWithSemanticsState();
}

class _ButtonsWithSemanticsState extends State<ButtonsWithSemantics> {
  bool isMessagesOn = false;

  void _onPressed() {
    // only fires if validation is successful
    print('_onPressed()');
  }

  String? _validator() {
    // placed here so it fires everytime
    isMessagesOn = !isMessagesOn;
    print('isMessagesOn: $isMessagesOn');
    if (isMessagesOn) return 'validation Message';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValidationButton(
            onPressed: _onPressed,
            child: const Text('ValidationButton'),
            validator: _validator),
        TextButton(
          onPressed: () {},
          child: const Text('TextButton'),
        ),
        ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
        OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
        const TextButton(
          onPressed: null,
          child: Text('TextButton'),
        ),
        const ElevatedButton(onPressed: null, child: Text('ElevatedButton')),
        const OutlinedButton(onPressed: null, child: Text('OutlinedButton'))
      ],
    );
  }
}
