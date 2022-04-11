import 'package:flutter/material.dart';

class ValidationButton extends StatefulWidget {
  const ValidationButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      required this.validator})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final String? Function() validator;

  @override
  State<ValidationButton> createState() => _ValidationButtonState();
}

class _ValidationButtonState extends State<ValidationButton> {
  String _validationMessage = '';

  void _onPressed() {
    _validationMessage = widget.validator() ?? '';
    print(
        'ValidationButton._onPressed() _validationMessage: $_validationMessage');
    if (_validationMessage.isEmpty) {
      widget.onPressed();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Column(
        children: [
          ElevatedButton(onPressed: _onPressed, child: widget.child),
          if (_validationMessage.isNotEmpty)
            Text(_validationMessage, style: const TextStyle(color: Colors.red)),
          // todo: figure out how to use the theme errorStyle
        ],
      ),
    );
  }
}
