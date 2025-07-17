import 'dart:convert';

import 'package:flutter_code_test_app/features/login/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final client = http.Client();

  Future<UserModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://daily-expense.wiremockapi.cloud/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Login failed");
    }
  }
}
