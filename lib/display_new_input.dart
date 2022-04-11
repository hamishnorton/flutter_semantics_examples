import 'package:flutter/material.dart';
import 'package:flutter_semantics_examples/theme/styles.dart';

class DisplayNewInput extends StatefulWidget {
  const DisplayNewInput({Key? key}) : super(key: key);

  @override
  State<DisplayNewInput> createState() => _DisplayNewInputState();
}

class _DisplayNewInputState extends State<DisplayNewInput> {
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Display New Input (live region announcement)'),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _toggle = !_toggle;
              });
            },
            child: const Text('Toggle')),
        Semantics(
          liveRegion: true,
          child: (_toggle)
              ? TextFormField(
                  decoration: Styles.buildInputDecoration(
                      null, '<name>@<domain>', 'Email Address'),
                )
              : const SizedBox(width: 1.0, height: 1.0),
          // note: can not have no child, or an empty container
        ),
      ],
    );
  }
}
