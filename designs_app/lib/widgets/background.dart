import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.2, 0.8],
      colors: [
        Color(0XFF2E305F),
        Color(0XFF202333),
      ],
    ),
  );

  const Background({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple gradient
        Container(decoration: boxDecoration),

        // Pink box
        const Positioned(
          top: -100,
          left: -30,
          child: _PinkBox(),
        ),
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(251, 142, 172, 1),
            ],
          ),
        ),
      ),
    );
  }
}
