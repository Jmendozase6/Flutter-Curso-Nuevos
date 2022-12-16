import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});
  static const String routeName = '/message';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No Data';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Screen'),
      ),
      body: Center(
        child: Text('$args'),
      ),
    );
  }
}
