import 'package:flutter/material.dart';

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function toZeroFn;

  const CustomFloatingActions({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.toZeroFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1),
        ),
        FloatingActionButton(
          onPressed: () => toZeroFn(),
          child: const Icon(Icons.exposure_zero),
        ),
      ],
    );
  }
}
