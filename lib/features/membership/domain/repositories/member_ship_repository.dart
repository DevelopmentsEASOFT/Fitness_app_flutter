import 'package:dio/dio.dart';

import '../../data/models/member_ship_history_list.dart';
import '../../data/models/user_member_ship.dart';

class MemberShipRepository {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3002',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {'Content-Type': 'application/json'},
    ),
  );
  Future<UserMemberShip> getMembershipInfo() async {
    try {
      final response = await _dio.get('/membership/info');
      return UserMemberShip.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching membership info: $e');
    }
  }

  Future<MemberShipHistoryList> getMembershipHistory() async {
    try {
      final response = await _dio.get('/membership/history');
      return MemberShipHistoryList.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching membership info: $e');
    }
  }
}
