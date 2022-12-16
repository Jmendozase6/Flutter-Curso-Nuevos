import 'package:flutter/material.dart';

import 'components/custom_floating_actions.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() => setState(() => counter++);
  void decrease() => setState(() => counter--);
  void toZero() => setState(() => counter = 0);

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Clicks counter', style: fontSize30),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActions(
          increaseFn: increase, decreaseFn: decrease, toZeroFn: toZero),
    );
  }
}
