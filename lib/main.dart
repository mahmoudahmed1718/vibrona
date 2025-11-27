import 'package:flutter/material.dart';
import 'package:vibrona/core/config/theme/app_theme.dart';
import 'package:vibrona/presentation/splash/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.lightTheme, home: SplashPage());
  }
}
