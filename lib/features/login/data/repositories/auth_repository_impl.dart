import 'package:flutter_code_test_app/features/login/data/datasources/remote_data_source.dart';
import 'package:flutter_code_test_app/features/login/domain/entities/user.dart';
import 'package:flutter_code_test_app/features/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remote;
  const AuthRepositoryImpl({required this.remote});

  @override
  Future<User> login(String name, String password) {
    return remote.login(name, password);
  }
}
