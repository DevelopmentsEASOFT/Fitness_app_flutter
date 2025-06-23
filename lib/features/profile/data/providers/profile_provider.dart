import 'package:riverpod/riverpod.dart';

import '../../ui/view_model/profile_view_model.dart';
import '../../domain/repositories/profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) => ProfileRepository());

final profileViewModelProvider = StateNotifierProvider<ProfileViewModel, ProfileState>(
  (ref) => ProfileViewModel(ref.watch(profileRepositoryProvider)),
);
