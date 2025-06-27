import 'member_ship_history.dart';

class MembershipHistoryList {
  List<MembershipHistory> shipList;

  MembershipHistoryList({required this.shipList});

  factory MembershipHistoryList.fromJson(Map<String, dynamic> json) {
    final historyItems = json.values.map((item) => MembershipHistory.fromJson(item as Map<String, dynamic>)).toList();
    return MembershipHistoryList(shipList: historyItems);
  }
}
