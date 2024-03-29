import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 17),
    ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
