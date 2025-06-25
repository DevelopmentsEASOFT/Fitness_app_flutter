import 'package:riverpod/riverpod.dart';
import '../../../domain/repositories/auth_repository.dart';

class LoginFormViewModel extends StateNotifier<LoginFormState> {
  final AuthRepository repository;

  LoginFormViewModel(this.repository) : super(LoginFormState());

  Future<bool> isLoggedIn({required String username, required String password}) async {
    state = state.copyWith(isLoading: true);
    try {
      final success = await repository.login(username, password);
      state = state.copyWith(isLoading: false, success: success);
      return success;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }
}

class LoginFormState {
  final bool isLoading;
  final bool? success;
  final String? error;

  LoginFormState({this.isLoading = false, this.success, this.error});

  LoginFormState copyWith({bool? isLoading, bool? success, String? error}) {
    return LoginFormState(isLoading: isLoading ?? this.isLoading, success: success ?? this.success, error: error);
  }
}
