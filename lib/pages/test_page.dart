import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key, required this.check}) : super(key: key);
  final ValueNotifier<bool> check;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Test"),
        elevation: 0,
      ),
      body: Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: check,
          builder: (context, deyer, _) {
            return Switch.adaptive(
              value: deyer,
              onChanged: (v) {
                check.value = v;
              },
            );
          },
        ),
      ),
    );
  }
}
