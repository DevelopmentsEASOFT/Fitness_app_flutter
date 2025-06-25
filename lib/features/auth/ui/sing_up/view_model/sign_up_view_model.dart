import 'package:riverpod/riverpod.dart';
import '../../../domain/repositories/auth_repository.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  final AuthRepository repository;

  SignUpViewModel(this.repository) : super(SignUpState());

  Future<bool> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null, success: null);
    try {
      final result = await repository.signUp(name: name, email: email, phone: phone, password: password);
      state = state.copyWith(isLoading: false, success: result, error: null);
      return result;
    } catch (e) {
      state = state.copyWith(isLoading: false, success: false, error: e.toString());
      return false;
    }
  }
}

class SignUpState {
  final bool isLoading;
  final bool? success;
  final String? error;

  SignUpState({this.isLoading = false, this.success, this.error});

  SignUpState copyWith({bool? isLoading, bool? success, String? error}) {
    return SignUpState(isLoading: isLoading ?? this.isLoading, success: success ?? this.success, error: error);
  }
}
