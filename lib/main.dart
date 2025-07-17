import 'package:flutter/material.dart';
import 'package:flutter_code_test_app/core/utils/constants/app_theme.dart';
import 'package:flutter_code_test_app/features/login/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
