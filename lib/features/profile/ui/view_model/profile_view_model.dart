import 'package:riverpod/riverpod.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final ProfileRepository repository;

  ProfileViewModel(this.repository) : super(ProfileState());

  Future<bool> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null, success: null);
    try {
      final result = await repository.updateProfile(name: name, email: email, phone: phone, password: password);
      state = state.copyWith(isLoading: false, success: result, error: null);
      return result;
    } catch (e) {
      state = state.copyWith(isLoading: false, success: false, error: e.toString());
      return false;
    }
  }
}

class ProfileState {
  final bool isLoading;
  final bool? success;
  final String? error;

  ProfileState({this.isLoading = false, this.success, this.error});

  ProfileState copyWith({bool? isLoading, bool? success, String? error}) {
    return ProfileState(isLoading: isLoading ?? this.isLoading, success: success ?? this.success, error: error);
  }
}
