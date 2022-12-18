import 'package:flutter/material.dart';

import 'package:push_notifications_app/core/constans/strings.dart';
import 'package:push_notifications_app/data/services/push_notification_service.dart';

import 'package:push_notifications_app/presentation/screens/screens.dart';

void main() async {
  // Initialize widgets
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize push notification
  await PushNotificationService.initializeApp();

  //
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    // Context!
    PushNotificationService.messagesStream.listen((message) {
      navigatorKey.currentState
          ?.pushNamed(MessageScreen.routeName, arguments: message);

      // Mostrar el snackbar
      final snackBar = SnackBar(content: Text(message));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messengerKey,
      title: Strings.appTitle,
      initialRoute: HomeScreen.routeName,
      routes: AppRouter.routes,
    );
  }
}
