import 'package:everything_calculator/components/key_button.dart';
import 'package:everything_calculator/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class KeysArea extends StatelessWidget {
  const KeysArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = context.read<Calculations>();
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.clearInput();
                    },
                    keyValue: "CE",
                    child: const Text("CE"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.clearHistory();
                    },
                    keyValue: "C",
                    child: const Text("C"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.removeInput();
                    },
                    keyValue: "backspace",
                    child: const Text("⌫"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "/",
                    child: const Text("/"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "7",
                    child: const Text("7"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "8",
                    child: const Text("8"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "9",
                    child: const Text("9"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "*",
                    child: const Text("x"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "4",
                    child: const Text("4"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "5",
                    child: const Text("5"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "6",
                    child: const Text("6"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "-",
                    child: const Text("-"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "1",
                    child: const Text("1"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "2",
                    child: const Text("2"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "3",
                    child: const Text("3"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "+",
                    child: const Text("+"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: ".",
                    child: const Text("."),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.enterInput(keyValue);
                    },
                    keyValue: "0",
                    child: const Text("0"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: KeyButton(
                            callback: (keyValue) {
                              data.enterInput(keyValue);
                            },
                            keyValue: "(",
                            child: const Text("("),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: KeyButton(
                            callback: (keyValue) {
                              data.enterInput(keyValue);
                            },
                            keyValue: ")",
                            child: const Text(")"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: KeyButton(
                    callback: (keyValue) {
                      data.addCalculationUnit();
                    },
                    keyValue: "=",
                    child: const Text("="),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
