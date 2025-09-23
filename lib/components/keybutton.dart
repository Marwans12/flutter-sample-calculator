import 'package:flutter/material.dart';

class KeyButton extends StatelessWidget {
  const KeyButton(
      {super.key,
      required this.child,
      required this.callback,
      required this.keyValue});
  final Widget child;
  final void Function(String keyValue) callback;
  final String keyValue;
  @override
  Widget build(BuildContext context) {
    var stockButton = FilledButton(
        onPressed: () {
                callback(keyValue);
              },
        style: FilledButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 73, 73, 73),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Center(child: child));
    return stockButton;
  }
}
