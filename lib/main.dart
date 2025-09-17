import 'package:flutter/material.dart';
import 'components/keybutton.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
            body: Center(
                child: Column(children: [
      Expanded(child: TypingArea()),
      Expanded(child: KeysArea())
    ]))));
  }
}

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
                      padding: const EdgeInsets.all(3.0),
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

class TypingArea extends StatelessWidget {
  const TypingArea({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.red,
    );
    throw UnimplementedError();
  }
}
