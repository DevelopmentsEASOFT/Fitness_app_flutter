import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/dio_provider.dart';
import '../../ui/view_model/member_ship_view_model.dart';
import '../../domain/repositories/member_ship_repository.dart';

final membershipRepositoryProvider = Provider<MembershipRepository>((ref) {
  final dio = ref.watch(membershipDioProvider);
  return MembershipRepository(dio);
});

final memberShipViewModelProvider = StateNotifierProvider<MembershipViewModel, MembershipState>(
  (ref) => MembershipViewModel(ref.read(membershipRepositoryProvider)),
);
