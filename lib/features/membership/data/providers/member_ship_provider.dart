import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui/view_model/member_ship_view_model.dart';
import '../../domain/repositories/member_ship_repository.dart';

final memberShipRepositoryProvider = Provider<MembershipRepository>((ref) => MembershipRepository());

final memberShipViewModelProvider = StateNotifierProvider<MembershipViewModel, MembershipState>(
  (ref) => MembershipViewModel(MembershipRepository()),
);
