import 'package:flutter/material.dart';
import 'package:package_tracker_app/theme/app_theme.dart';
import 'package:package_tracker_app/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlueJay Package Tracking',
      theme: AppTheme.themeData,
      home: const Home(),
    );
  }
}
