import 'package:everything_calculator/calculations_provider.dart';
import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CalculationUnit extends StatefulWidget {
  final String initialCalculation;
  final TextEditingController controller;
  final FocusNode focusNode;
  const CalculationUnit(
      {super.key,
      this.initialCalculation = "",
      required this.controller,
      required this.focusNode});

  @override
  State<CalculationUnit> createState() => _CalculationUnitState();
}

class _CalculationUnitState extends State<CalculationUnit> {
  dynamic calcResult;
  Border? border;
  final emptyResult = const SelectableText(
    " ",
    textAlign: TextAlign.end,
  );
  final error = const Icon(
    Icons.warning,
    color: Colors.orangeAccent,
  );
  final evaluator = const ExpressionEvaluator();
  late String calculation = widget.initialCalculation;
  late Widget result = emptyResult;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasPrimaryFocus) {
        var provider = context.read<Calculations>();
        provider.lastFocusedUnit = widget;
        provider.lastSelectionBase = widget.controller.selection.baseOffset;
        provider.lastSelectionExtent = widget.controller.selection.extentOffset;
      }
    });
        widget.focusNode.onKeyEvent = (var node, var event) {
      if (event is KeyDownEvent) {
        var provider = context.read<Calculations>();
        switch (event.logicalKey) {
          case LogicalKeyboardKey.enter:
            provider.addCalculationUnit();
            return KeyEventResult.handled;
          case LogicalKeyboardKey.backspace:
            provider.removeInput();
            return KeyEventResult.handled;
          case LogicalKeyboardKey.arrowUp:
            provider.moveFocus("up");
            return KeyEventResult.handled;
          case LogicalKeyboardKey.arrowDown:
            provider.moveFocus("down");
            return KeyEventResult.handled;
        }
      }
      return KeyEventResult.ignored;
    };
    widget.controller.addListener(() {
      var provider = context.read<Calculations>();
      provider.lastSelectionBase = widget.controller.selection.baseOffset;
      provider.lastSelectionExtent = widget.controller.selection.extentOffset;
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    var focusedUnit =
        context.select((Calculations calcs) => calcs.lastFocusedUnit);
    var rawResult = context.select((Calculations calcs) =>
        calcs.results[calcs.calculationHistory.indexOf(widget)]);
    Border border;
    if (focusedUnit == widget) {
      border = Border.all(width: 1, color: Colors.blueAccent);
    } else {
      border = Border.all(width: 1, color: Colors.black);
    }

    if (rawResult == null) {
      result = error;
    } else if (rawResult == "") {
      result = emptyResult;
    } else {
      result = SelectableText("= $rawResult");
    }

    return Container(
      decoration: BoxDecoration(border: border),
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              focusNode: widget.focusNode,
              decoration: null,
              controller: widget.controller,
              keyboardType: TextInputType.none,
            ),
            result
          ],
        ),
      ),
    );
  }
}
