import 'package:flutter/material.dart';

class TypingArea extends StatefulWidget {
  const TypingArea({super.key});

  @override
  State<TypingArea> createState() => _TypingAreaState();
}

class _TypingAreaState extends State<TypingArea> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextField(
          decoration: null,
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                "24",
                textScaler: TextScaler.linear(1.5),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        )
      ],
    );
  }
}