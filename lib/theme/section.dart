import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      color: Colors.white70,
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
    );
  }
}
