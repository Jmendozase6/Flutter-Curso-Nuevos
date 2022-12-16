import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/landscape.jpg'),
          const Title(),
          const ButtonSection(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text(
              'Fugiat aliquip aute aliqua veniam ex culpa minim enim ullamco laborum velit amet. Exercitation reprehenderit dolor anim id dolor. Ipsum ullamco tempor excepteur non. Consequat ipsum deserunt labore ea irure duis tempor est nulla aliquip nulla cillum magna nisi.',
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CustomButton(icon: Icons.call, text: 'CALL'),
          CustomButton(icon: Icons.send, text: 'ROUTE'),
          CustomButton(icon: Icons.share, text: 'SHARE'),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.lightBlue[600]),
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(color: Colors.lightBlue[600]),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Lorem consectetur exercitation.',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('exercitation ea laboris.',
                  style: TextStyle(color: Colors.black45)),
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.red),
          const Text('41'),
        ],
      ),
    );
  }
}
