import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (builder) => CupertinoAlertDialog(
        title: const Text('Title'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("This is the alert's content."),
            SizedBox(height: 10),
            FlutterLogo(size: 100),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        title: const Text('Title'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("This is the alert's content."),
            SizedBox(height: 10),
            FlutterLogo(size: 100),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text('Show Alert', style: TextStyle(fontSize: 16)),
          ),
          onPressed: () {
            Platform.isAndroid
                ? displayDialogAndroid(context)
                : displayDialogIOS(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
