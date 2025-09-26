import 'package:everything_calculator/Structure/keys_area.dart';
import 'package:everything_calculator/Structure/typing_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          child: Center(
              child: ChangeNotifierProvider(
            create: (context) => Calculations(),
            child: const Column(children: [
              Expanded(child: TypingArea()),
              Expanded(child: KeysArea())
            ]),
          )),
        )));
  }
}

class Calculations extends ChangeNotifier {
  // int? previousResult;
  // int? result = 0;
  // String expression = "";
  // void addCharacter(keyValue) {
  //   expression += keyValue;
  //   calculate();
  // }
  // int calculate() {
    
  // }
}
