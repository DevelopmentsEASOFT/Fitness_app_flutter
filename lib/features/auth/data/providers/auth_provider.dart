import 'package:riverpod/riverpod.dart';

import '../../ui/login/view_model/login_view_model.dart';
import '../../ui/sing_up/view_model/sign_up_view_model.dart';
import '../../domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository());

final loginViewModelProvider = StateNotifierProvider<LoginFormViewModel, LoginFormState>(
  (ref) => LoginFormViewModel(ref.read(authRepositoryProvider)),
);

final signUpViewModelProvider = StateNotifierProvider<SignUpViewModel, SignUpState>(
  (ref) => SignUpViewModel(ref.read(authRepositoryProvider)),
);
