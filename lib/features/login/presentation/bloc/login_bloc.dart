import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_test_app/features/login/domain/usecases/login_usecase.dart';

class LoginState {
  final bool loading;
  final String? deepLink;
  final String? error;

  LoginState({this.loading = false, this.deepLink, this.error});

  factory LoginState.loading() => LoginState(loading: true);
  factory LoginState.success(String deepLink) => LoginState(deepLink: deepLink);
  factory LoginState.failure(String error) => LoginState(error: error);
}

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginState()) {
    getPolicies();
  }

  Future<void> getPolicies() async {
    emit(LoginState.loading());

    try {
      final tenantId = '318a987a-8408-4f5e-93c0-5644fd4c9hf5';
      final tenantPassword = '!hosFS8xAmgh@b!%';

      final token = await loginUseCase.getAuthToken(tenantId, tenantPassword);
      if (token == null || token.isEmpty) {
        emit(LoginState.failure('Token is null or empty.'));
        return;
      }

      final policyId = await loginUseCase.getPolicies(token);
      if (policyId == null) {
        emit(LoginState.failure('Policy ID is null.'));
        return;
      }

      final data = {
        "type": "connectionless-verification",
        "metadata": {"policyId": policyId, "tenantId": tenantId},
        "rcb": 'redirectUrl',
        "wcb": 'webhookUrl',
      };

      final jsonString = jsonEncode(data);
      final base64String = base64Encode(utf8.encode(jsonString));
      final deepLink =
          "zada://network/connectionless-verification?data=$base64String";

      emit(LoginState.success(deepLink));
    } catch (e) {
      emit(LoginState.failure(e.toString()));
    }
  }
}
