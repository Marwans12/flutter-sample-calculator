import 'package:everything_calculator/Structure/keys_area.dart';
import 'package:everything_calculator/calculations_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
          appBar: AppBar(title: const Text("Calculator"),),
            body: Container(
          color: const Color.fromARGB(255, 49, 49, 49),
          child: Center(
              child: ChangeNotifierProvider(
            create: (context) => Calculations(),
            child: const Column(children: [
              Expanded(child: TypingArea()),
              Expanded(child: KeysArea()),
            ]),
          )),
        )));
  }
}

class TypingArea extends StatefulWidget {
  const TypingArea({super.key});

  @override
  State<TypingArea> createState() => _TypingAreaState();
}

class _TypingAreaState extends State<TypingArea> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
        (_) => context.read<Calculations>().addCalculationUnit());
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<Calculations>();

    return SingleChildScrollView(
      reverse: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...provider.calculationHistory,
        ],
      ),
    );
  }
}
