import 'package:riverpod/riverpod.dart';
import '../../../../data/repository/providers/auth_repository_provider.dart';
import '../../../../data/repository/auth_repository.dart';

// Estado para el formulario de registro
class SignUpState {
  final bool isLoading;
  final bool? success;
  final String? error;

  SignUpState({this.isLoading = false, this.success, this.error});

  SignUpState copyWith({bool? isLoading, bool? success, String? error}) {
    return SignUpState(isLoading: isLoading ?? this.isLoading, success: success ?? this.success, error: error);
  }
}

// ViewModel para el formulario de registro
class SignUpViewModel extends StateNotifier<SignUpState> {
  final AuthRepository repository;

  SignUpViewModel(this.repository) : super(SignUpState());

  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null, success: null);
    try {
      final result = await repository.doSignUp(name: name, email: email, phone: phone, password: password);
      state = state.copyWith(isLoading: false, success: result, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, success: false, error: e.toString());
    }
  }
}

// Provider para el ViewModel
final signUpFormViewModelProvider = StateNotifierProvider<SignUpViewModel, SignUpState>(
  (ref) => SignUpViewModel(ref.read(authRepositoryProvider)),
);
