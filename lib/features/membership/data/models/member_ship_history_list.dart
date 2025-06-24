import 'member_ship_history.dart';

class MembershipHistoryList {
  List<MembershipHistory> shipList;

  MembershipHistoryList({required this.shipList});

  factory MembershipHistoryList.fromJson(Map<String, dynamic> json) {
    return MembershipHistoryList(
      shipList:
          (json['shipList'] as List)
              .map((workout) => MembershipHistory.fromJson(workout as Map<String, dynamic>))
              .toList(),
    );
  }
}
