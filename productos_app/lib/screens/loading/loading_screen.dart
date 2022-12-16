import 'package:flutter/material.dart';
import 'package:productos_app/theme/app_theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading'),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }
}
