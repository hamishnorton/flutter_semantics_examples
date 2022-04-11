import 'package:flutter/material.dart';
import 'package:flutter_semantics_examples/theme/styles.dart';

class DisplayNewInputErrorOnHide extends StatefulWidget {
  const DisplayNewInputErrorOnHide({Key? key}) : super(key: key);

  @override
  State<DisplayNewInputErrorOnHide> createState() =>
      _DisplayNewInputErrorOnHideState();
}

class _DisplayNewInputErrorOnHideState
    extends State<DisplayNewInputErrorOnHide> {
  bool _toggle = false;
  static const String _label = 'Email Address';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Display New Input (live region announcement'),
        const Text('Error on hide'),
        const Text('"now showing" not announced'),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _toggle = !_toggle;
              });
            },
            child: const Text('Toggle')),
        Semantics(
          liveRegion: true,
          label: (_toggle) ? 'now showing $_label' : 'now hiding $_label',
          // Error: On hide
          // The following TypeErrorImpl was thrown during a scheduler callback:
          // Unexpected null value.
          // Warning: 'now showing' isn't announced
          child: (_toggle)
              ? TextFormField(
                  decoration: Styles.buildInputDecoration(
                      null, '<name>@<domain>', _label),
                )
              : const SizedBox(width: 1.0, height: 1.0),
          // note: can not have no child, or an empty container
        ),
      ],
    );
  }
}
