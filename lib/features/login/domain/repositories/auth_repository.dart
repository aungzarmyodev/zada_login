import 'package:flutter_code_test_app/features/login/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String name, String password);
}
