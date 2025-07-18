import 'package:flutter_code_test_app/features/login/data/datasources/remote_data_source.dart';
import 'package:flutter_code_test_app/features/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remote;
  const AuthRepositoryImpl({required this.remote});

  @override
  Future<String?> getAuthToken(String talentId, String talentPassword) {
    return remote.getAuthToken(talentId, talentPassword);
  }

  @override
  Future<String?> getPolicies(String token) {
    return remote.getPolicies(token);
  }
}
