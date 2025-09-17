import 'package:flutter/material.dart';

class KeyButton extends StatefulWidget {
  const KeyButton({super.key, required this.child, required this.callback});
  final Widget child;
  final void Function()? callback;

  @override
  State<KeyButton> createState() => _KeyButtonState();
}

class _KeyButtonState extends State<KeyButton> {
  @override
  Widget build(BuildContext context) {
    var stockButton = FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 73, 73, 73),
            padding: const EdgeInsets.all(2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Center(child: widget.child));
    return stockButton;
  }
}
