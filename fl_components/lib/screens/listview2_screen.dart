import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  final options = const ['Mango', 'Apple', 'Orange', 'Banana', 'Pineapple'];

  const ListView2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Tipo 2'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            final fruit = options[index];
            debugPrint(fruit);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
