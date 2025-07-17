import 'package:flutter_code_test_app/features/login/domain/entities/user.dart';
import 'package:flutter_code_test_app/features/login/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase({required this.repository});

  Future<User> login(String email, String password) {
    return repository.login(email, password);
  }
}
