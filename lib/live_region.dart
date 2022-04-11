import 'package:flutter/material.dart';

class LiveRegion extends StatefulWidget {
  const LiveRegion({Key? key}) : super(key: key);

  @override
  State<LiveRegion> createState() => _LiveRegionState();
}

class _LiveRegionState extends State<LiveRegion> {
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Live Region'),
        Semantics(
          liveRegion: true,
          label: (_toggle) ? 'On' : 'Off',
          child: const SizedBox(width: 1.0, height: 1.0),
          // note: can not have no child, or an empty container
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _toggle = !_toggle;
              });
            },
            child: const Text('Toggle'))
      ],
    );
  }
}
