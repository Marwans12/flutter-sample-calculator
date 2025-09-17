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
            padding: const EdgeInsets.all(2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Center(child: widget.child));
    var scratchButton = Card(
      color: const Color(0x00000000),
      shadowColor: const Color(0x00000000),
      child: InkWell(
        radius: 5,
        onTap: widget.callback,
        child: SizedBox.square(
          dimension: 20,
          child: Center(child: widget.child),
        ),
      ),
    );
    return stockButton;
  }
}
