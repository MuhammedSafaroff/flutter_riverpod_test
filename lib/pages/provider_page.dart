import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = StateProvider.autoDispose<int>((ref) => 0);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("ProviderPage"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: Consumer(
              builder: (context, WidgetRef ref, _) {
                final state = ref.watch(valueProvider);
                return Text(
                  "value: $state",
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Material(
              color: Colors.amber,
              child: InkWell(
                onTap: () {
                  ref.read(valueProvider.notifier).state++;
                },
                child: Container(
                  width: 100,
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text("Inc"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
