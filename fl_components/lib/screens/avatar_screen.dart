import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Avatars'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[800],
              child: const Text('SL'),
            ),
          ),
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 100,
          backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/9/90/Spiderman.JPG'),
        ),
      ),
    );
  }
}
