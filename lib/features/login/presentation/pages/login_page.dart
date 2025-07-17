import 'package:flutter/material.dart';
import 'package:flutter_code_test_app/features/login/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginForm());
  }
}
