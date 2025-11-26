import 'package:everything_calculator/main.dart';
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

      setState(() {
        calculation = widget.controller.text;
      });
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var unit = context.select((Calculations calcs) => calcs.lastFocusedUnit);
    Border? border;
    if (unit == widget) {
      border = Border.all(width: 1, color: Colors.blueAccent);
    } else {
      border = Border.all(width: 1, color: Colors.black);
    }

    if (calculation.isNotEmpty) {
      try {
        var expression = Expression.parse(calculation);
        calcResult = evaluator.eval(expression, {});
        calcResult == null
            ? result = error
            : result = SelectableText("= $calcResult");
      } catch (e) {
        result = error;
      }
    } else {
      result = emptyResult;
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
