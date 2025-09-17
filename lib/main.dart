import 'package:flutter/material.dart';
import 'components/keybutton.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Column(
            children: [
              // Expanded(child: Container(color: Colors.lightBlue[50],child: const Text("Beeg container"),)),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 5,
                  children: [...List.generate(20, (i) {
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: KeyButton(child: Text("$i"), callback: () {}),
                    );
                  })],
                            // Column(
                            //   children: [
                            //     Expanded(child: TypingArea()),
                            //     Expanded(child: KeysAera())
                            //   ],
                            // ),
                            ),
              )],
          ),
    )));
  }
}

class KeysAera extends StatelessWidget {
  const KeysAera({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 5,
      children: [
        ...List.generate(20, (i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: KeyButton(child: const Text("data"), callback: () {}),
          );
        })
      ],
    );
    throw UnimplementedError();
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
