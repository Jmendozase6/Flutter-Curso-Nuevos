import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//SHA1: 2B:DC:DD:7F:79:B7:E6:FB:F2:6D:23:F3:FB:03:CC:C3:61:DE:98:F6

// SHA256: E8:1F:66:04:05:2D:A8:43:E0:17:B5:49:1A:62:32:C2:3F:F9:DF:16:32:67:64:93:61:8E:24:F3:7C:09:4F:1D

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    // print('on Background Handler ${message.messageId}');

    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No title');
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    // print('on Message Handler ${message.messageId}');

    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No title');
  }

  static Future<void> _onMessageOpenedApp(RemoteMessage message) async {
    // print('on Message opened app Handler ${message.messageId}');

    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No title');
  }

  static Future initializeApp() async {
    // Push notifications

    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    // Local notifications
  }

  static closeStream() {
    _messageStream.close();
  }
}
