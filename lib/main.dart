import 'package:everything_calculator/Structure/keys_area.dart';
import 'package:everything_calculator/components/calculation_unit.dart';
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

class Calculations extends ChangeNotifier {
  final controllers = <CalculationUnit, TextEditingController>{};
  final focusNodes = <CalculationUnit, FocusNode>{};
  final calculationHistory = <CalculationUnit>[];
  CalculationUnit? _lastFocusedUnit;
  var lastSelectionBase = 0;
  var lastSelectionExtent = 0;

  CalculationUnit? get lastFocusedUnit => _lastFocusedUnit;

  set lastFocusedUnit(CalculationUnit? unit) {
    _lastFocusedUnit = unit;
    notifyListeners();
  }

  void addCalculationUnit() {
    var controller = TextEditingController();
    var focusNode = FocusNode();
    var calculationUnit = CalculationUnit(
      key: UniqueKey(),
      controller: controller,
      focusNode: focusNode,
    );
    controllers[calculationUnit] = controller;
    focusNodes[calculationUnit] = focusNode;
    if (calculationHistory.isEmpty) {
      calculationHistory.add(calculationUnit);
    } else {
      calculationHistory.insert(
          calculationHistory.indexOf(lastFocusedUnit!) + 1, calculationUnit);
    }
    notifyListeners();
  }

  void removeCalculationUnit(CalculationUnit item) {
    if (calculationHistory.length == 1) {
      return;
    }

    var itemIndex = calculationHistory.indexOf(item);
    if (calculationHistory.remove(item) != true) {
      throw Exception("Attempt to remove non existing calc unit");
    }
    controllers[item]!.dispose();
    focusNodes[item]!.dispose();
    controllers.remove(item);
    focusNodes.remove(item);
    if (itemIndex == 0) {
      focusNodes[calculationHistory[0]]!.requestFocus();
    } else {
      focusNodes[calculationHistory.elementAt(itemIndex - 1)]!.requestFocus();
    }
    notifyListeners();
  }

  void enterInput(String input) {
    var controller = lastFocusedUnit!.controller;
    if (lastSelectionBase > lastSelectionExtent) {
      var temp = lastSelectionBase;
      lastSelectionBase = lastSelectionExtent;
      lastSelectionExtent = temp;
    }

    controller.value = TextEditingValue(
            text: controller.text,
            selection: TextSelection.collapsed(offset: lastSelectionBase))
        .replaced(TextRange(start: lastSelectionBase, end: lastSelectionExtent),
            input);
    focusNodes[lastFocusedUnit]!.requestFocus();
  }

  void removeInput() {
    var controller = lastFocusedUnit!.controller;
    if (controller.selection.isCollapsed && lastSelectionBase != 0) {
      controller.value = TextEditingValue(
              text: controller.text,
              selection: TextSelection.collapsed(offset: lastSelectionBase - 1))
          .replaced(
              TextRange(start: lastSelectionBase - 1, end: lastSelectionBase),
              "");
      focusNodes[lastFocusedUnit]!.requestFocus();
    } else {
      controller.text.trim() == ""
          ? removeCalculationUnit(lastFocusedUnit!)
          : enterInput("");
    }
  }

  void clearInput() {
    lastFocusedUnit!.controller.value = const TextEditingValue(
        text: "", selection: TextSelection.collapsed(offset: 0));
    focusNodes[lastFocusedUnit]!.requestFocus();
  }

  void clearHistory() {
    calculationHistory.clear();
    controllers.values.map((controller) => controller.dispose());
    focusNodes.values.map((focusNode) => focusNode.dispose());
    addCalculationUnit();
  }

  void moveCursor(String direction) {
    var controller = lastFocusedUnit!.controller;
    if (lastSelectionBase > lastSelectionExtent) {
      var temp = lastSelectionBase;
      lastSelectionBase = lastSelectionExtent;
      lastSelectionExtent = temp;
    }

    if (direction == 'left') {
      if (controller.selection.isCollapsed && lastSelectionBase != 0) {
        controller.selection =
            TextSelection.collapsed(offset: lastSelectionBase - 1);
      } else {
        controller.selection =
            TextSelection.collapsed(offset: lastSelectionBase);
      }
    }
    if (direction == 'right') {
      if (controller.selection.isCollapsed &&
          lastSelectionExtent != controller.text.length) {
        controller.selection =
            TextSelection.collapsed(offset: lastSelectionExtent + 1);
      } else {
        controller.selection =
            TextSelection.collapsed(offset: lastSelectionExtent);
      }
    }
    focusNodes[lastFocusedUnit]!.requestFocus();
  }

  void moveFocus(String direction) {
    var index = calculationHistory.indexOf(lastFocusedUnit!);
    if (direction == 'up' && index != 0) {
      focusNodes[calculationHistory[index - 1]]!.requestFocus();
    }
    else if (direction == 'down' && index != calculationHistory.length - 1) {
      focusNodes[calculationHistory[index + 1]]!.requestFocus();
    } else {
      focusNodes[lastFocusedUnit]!.requestFocus();
    }

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
