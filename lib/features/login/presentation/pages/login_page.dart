import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_test_app/features/login/data/datasources/remote_data_source.dart';
import 'package:flutter_code_test_app/features/login/data/repositories/auth_repository_impl.dart';
import 'package:flutter_code_test_app/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_code_test_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_code_test_app/features/login/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final remote = RemoteDataSource();
    final repo = AuthRepositoryImpl(remote: remote);
    final loginUseCase = LoginUsecase(repository: repo);
    return BlocProvider(
      create: (_) => LoginCubit(loginUseCase),
      child: LoginForm(), // actual login form here
    );
  }
}
