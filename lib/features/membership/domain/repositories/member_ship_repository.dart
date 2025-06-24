import 'package:dio/dio.dart';

import '../../data/models/member_ship_history_list.dart';
import '../../data/models/user_member_ship.dart';

class MembershipRepository {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3002',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {'Content-Type': 'application/json'},
    ),
  );
  Future<UserMembership> getMembershipInfo() async {
    try {
      final response = await _dio.get('/membership/info');
      return UserMembership.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching membership info: $e');
    }
  }

  Future<MembershipHistoryList> getMembershipHistory() async {
    try {
      final response = await _dio.get('/membership/history');
      return MembershipHistoryList.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching membership info: $e');
    }
  }
}
