import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui/view_model/member_ship_view_model.dart';
import '../../domain/repositories/member_ship_repository.dart';

final memberShipRepositoryProvider = Provider<MemberShipRepository>((ref) => MemberShipRepository());

final memberShipViewModelProvider = StateNotifierProvider<MemberShipViewModel, MemberShipState>(
  (ref) => MemberShipViewModel(MemberShipRepository()),
);
