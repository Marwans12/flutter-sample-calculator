import 'package:everything_calculator/Structure/keys_area.dart';
import 'package:everything_calculator/Structure/typing_area.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
        home: Scaffold(
            body: Container(
              color: const Color.fromARGB(255, 49, 49, 49),
              child: const Center(
                  child: Column(children: [
                    Expanded(child: TypingArea()),
                    Expanded(child: KeysArea())
                  ])),
            )));
  }
}
