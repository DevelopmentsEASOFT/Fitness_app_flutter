import 'member_ship_history.dart';

class MemberShipHistoryList {
  List<MemberShipHistory> shipList;

  MemberShipHistoryList({required this.shipList});

  factory MemberShipHistoryList.fromJson(Map<String, dynamic> json) {
    return MemberShipHistoryList(
      shipList:
          (json['shipList'] as List)
              .map((workout) => MemberShipHistory.fromJson(workout as Map<String, dynamic>))
              .toList(),
    );
  }
}
