import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_test_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? deepLink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state.deepLink != null) {
            deepLink = state.deepLink;
            return _main();
          }

          if (state.error != null) {
            return Text("Error: ${state.error}");
          }

          return Text("Initializing...");
        },
      ),
    );
  }

  Future<void> _openZadaApp() async {
    if (deepLink != null) {
      final Uri url = Uri.parse(deepLink!);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }
  }

  Widget _main() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text('If you have a deeplink to open Zada app. $deepLink'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _openZadaApp();
            },
            child: Text('Open Zada'),
          ),
        ],
      ),
    );
  }
}
