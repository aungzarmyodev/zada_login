import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_test_app/features/login/presentation/bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.user != null) {
            _success();
          }
        },
        child: Center(
          child: Padding(padding: const EdgeInsets.all(20.0), child: _main()),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;
    // Simulate login delay
    context.read<LoginCubit>().login(
      _nameController.text,
      _passwordController.text,
    );
  }

  void _success() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login Successful!')));
    });
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) return 'Please enter email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter password';
    return null;
  }

  Widget _main() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: 'Enter Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            validator: _validateName,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Enter Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            obscureText: true,
            validator: _validatePassword,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _submit();
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
