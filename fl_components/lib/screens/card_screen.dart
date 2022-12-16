import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl:
                'https://photographylife.com/wp-content/uploads/2016/06/Mass.jpg',
          ),
          SizedBox(height: 20),
          CustomCardType2(
              imageUrl:
                  'https://img.freepik.com/free-vector/hand-drawn-flat-design-mountain-landscape_52683-79195.jpg?w=2000'),
          SizedBox(height: 20),
          CustomCardType2(
              imageUrl:
                  'https://mymodernmet.com/wp/wp-content/uploads/2020/02/Landscape-Photographer-of-the-Year-Sander-Grefte.jpg',
              name: 'A Beautiful Landscape'),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
