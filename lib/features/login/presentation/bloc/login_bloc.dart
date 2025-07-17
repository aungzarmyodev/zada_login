import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_test_app/features/login/domain/entities/user.dart';
import 'package:flutter_code_test_app/features/login/domain/usecases/login_usecase.dart';

class LoginState {
  final bool loading;
  final User? user;
  final String? error;

  LoginState({this.loading = false, this.user, this.error});
}

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginState());

  Future<void> login(String email, String password) async {
    emit(LoginState(loading: true));

    try {
      final user = await loginUseCase.login(email, password);
      emit(LoginState(user: user));
    } catch (e) {
      emit(LoginState(error: e.toString()));
    }
  }
}
