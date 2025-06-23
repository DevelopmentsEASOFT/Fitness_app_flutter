import 'package:riverpod/riverpod.dart';
import '../../../domain/repositories/auth_repository.dart';

class LoginFormState {
  final bool isLoading;
  final bool? success;
  final String? error;

  LoginFormState({this.isLoading = false, this.success, this.error});

  LoginFormState copyWith({bool? isLoading, bool? success, String? error}) {
    return LoginFormState(isLoading: isLoading ?? this.isLoading, success: success ?? this.success, error: error);
  }
}

class LoginFormViewModel extends StateNotifier<LoginFormState> {
  final AuthRepository repository;

  LoginFormViewModel(this.repository) : super(LoginFormState());

  Future<void> login({required String username, required String password}) async {
    state = state.copyWith(isLoading: true, error: null, success: null);
    try {
      final result = await repository.doLogin(username, password);
      state = state.copyWith(isLoading: false, success: result, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, success: false, error: e.toString());
    }
  }
}
