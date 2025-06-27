import 'package:dio/dio.dart';

import '../../../../core/api/api_endpoints.dart';
import '../../data/models/member_ship_history_list.dart';
import '../../data/models/user_member_ship.dart';
import '../exceptions/membership_exception.dart';

class MembershipRepository {
  const MembershipRepository(this._dio);
  final Dio _dio;
  Future<UserMembership> getMembershipInfo() async {
    try {
      final response = await _dio.get(ApiEndpoints.membershipDetails(''));
      return UserMembership.fromJson(response.data);
    } catch (e) {
      throw MembershipException('Error fetching membership info: $e');
    }
  }

  Future<MembershipHistoryList> getMembershipHistory() async {
    try {
      final response = await _dio.get(ApiEndpoints.paymentHistory(''));
      return MembershipHistoryList.fromJson(response.data);
    } catch (e) {
      throw MembershipException('Error fetching membership info: $e');
    }
  }
}
