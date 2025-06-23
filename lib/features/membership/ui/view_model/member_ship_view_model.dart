import 'package:riverpod/riverpod.dart';
import '../../data/models/member_ship_history_list.dart';
import '../../domain/repositories/member_ship_repository.dart';
import '../../data/models/user_member_ship.dart';

class MemberShipState {
  final bool isLoading;
  final UserMemberShip? membership;
  final String? error;
  final MemberShipHistoryList? memberShipHistory;

  MemberShipState({this.isLoading = false, this.membership, this.error, this.memberShipHistory});

  MemberShipState copyWith({
    bool? isLoading,
    UserMemberShip? membership,
    String? error,
    MemberShipHistoryList? memberShipHistory,
  }) {
    return MemberShipState(
      isLoading: isLoading ?? this.isLoading,
      membership: membership ?? this.membership,
      error: error,
      memberShipHistory: memberShipHistory ?? this.memberShipHistory,
    );
  }
}

class MemberShipViewModel extends StateNotifier<MemberShipState> {
  final MemberShipRepository repository;

  MemberShipViewModel(this.repository) : super(MemberShipState());

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
