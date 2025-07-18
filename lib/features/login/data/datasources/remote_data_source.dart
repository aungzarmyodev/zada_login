// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final client = http.Client();
  final baseUrl = "https://test.zadanetwork.com/api";

  Future<String?> getAuthToken(String tenantId, String tenantPassword) async {
    final response = await client.post(
      Uri.parse('$baseUrl/authenticate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'tenantId': tenantId, 'secretPhrase': tenantPassword}),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['success'] == true && json['token'] != null) {
        return json['token'];
      } else {
        print("Login success but token not found: $json");
        return null;
      }
    } else {
      print("Login failed: ${response.body}");
      return null;
    }
  }

  Future<String?> getPolicies(String token) async {
    final response = await client.get(
      Uri.parse('$baseUrl/policy/get_all_policies'),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json["success"] == true &&
          json["policies"] != null &&
          json["policies"].isNotEmpty) {
        return json["policies"][0]["policyId"];
      } else {
        print("No policies found");
        return null;
      }
    } else {
      print("Failed to fetch policies: ${response.body}");
      return null;
    }
  }
}
