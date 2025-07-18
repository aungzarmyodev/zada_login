import 'package:flutter_code_test_app/features/login/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase({required this.repository});

  Future<String?> getAuthToken(String tenantId, String tenantPassword) {
    return repository.getAuthToken(tenantId, tenantPassword);
  }

  Future<String?> getPolicies(String token) {
    return repository.getPolicies(token);
  }
}
