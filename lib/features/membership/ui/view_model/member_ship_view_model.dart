import 'package:riverpod/riverpod.dart';
import '../../data/models/member_ship_history_list.dart';
import '../../domain/repositories/member_ship_repository.dart';
import '../../data/models/user_member_ship.dart';

class MembershipViewModel extends StateNotifier<MembershipState> {
  final MembershipRepository repository;

  MembershipViewModel(this.repository) : super(MembershipState());

  Future<void> fetchMembershipInfo() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final membership = await repository.getMembershipInfo();
      state = state.copyWith(isLoading: false, membership: membership, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> fetchMembershipHistory() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final history = await repository.getMembershipHistory();
      state = state.copyWith(isLoading: false, error: null, memberShipHistory: history);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

class MembershipState {
  final bool isLoading;
  final UserMembership? membership;
  final String? error;
  final MembershipHistoryList? memberShipHistory;

  MembershipState({this.isLoading = false, this.membership, this.error, this.memberShipHistory});

  MembershipState copyWith({
    bool? isLoading,
    UserMembership? membership,
    String? error,
    MembershipHistoryList? memberShipHistory,
  }) {
    return MembershipState(
      isLoading: isLoading ?? this.isLoading,
      membership: membership ?? this.membership,
      error: error,
      memberShipHistory: memberShipHistory ?? this.memberShipHistory,
    );
  }
}
