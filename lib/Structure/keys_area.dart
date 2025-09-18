import 'package:everything_calculator/components/keybutton.dart';
import 'package:flutter/material.dart';

class KeysArea extends StatelessWidget {
  const KeysArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(4, (i) {
          return Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...List.generate(5, (j) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: KeyButton(
                        callback: () {},
                        child: Text("${(i * 5) + j + 1}"),
                      ),
                    ),
                  );
                })
              ],
            ),
          );
        })
      ],
    );
  }
}
