import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.generating_tokens_outlined,
              text: 'Popular',
              colors: [
                Colors.blue,
                Colors.lightBlue,
              ],
            ),
            _SingleCard(
              icon: Icons.emoji_transportation,
              text: 'Categories',
              colors: [
                Colors.red,
                Colors.orange,
              ],
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.border_all,
              text: 'Popular',
              colors: [
                Colors.pink,
                Colors.pinkAccent,
              ],
            ),
            _SingleCard(
              icon: Icons.ac_unit,
              text: 'Categories',
              colors: [
                Colors.green,
                Colors.greenAccent,
              ],
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.border_all,
              text: 'Popular',
              colors: [
                Colors.indigo,
                Colors.blueGrey,
              ],
            ),
            _SingleCard(
              icon: Icons.ac_unit,
              text: 'Categories',
              colors: [
                Colors.red,
                Colors.orange,
              ],
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              icon: Icons.border_all,
              text: 'Popular',
              colors: [
                Colors.blue,
                Colors.lightBlue,
              ],
            ),
            _SingleCard(
              icon: Icons.ac_unit,
              text: 'Categories',
              colors: [
                Colors.red,
                Colors.orange,
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final List<Color> colors;

  const _SingleCard({
    required this.icon,
    required this.text,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return _SingleCardBackground(
        widget: _CardItem(
      colors: colors,
      icon: icon,
      text: text,
    ));
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({
    Key? key,
    required this.colors,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final List<Color> colors;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: colors),
          ),
          child: CircleAvatar(
            backgroundColor: const Color.fromRGBO(1, 1, 1, 0),
            radius: 30,
            child: Icon(icon, size: 35, color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        Text(text, style: const TextStyle(color: Colors.blue, fontSize: 18)),
      ],
    );
  }
}

class _SingleCardBackground extends StatelessWidget {
  final Widget widget;

  const _SingleCardBackground({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: widget,
          ),
        ),
      ),
    );
  }
}
