import 'package:dio/dio.dart';

class ProfileRepository {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3002',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<bool> doUpdateProfile({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/signup',
        data: {'name': name, 'email': email, 'phone': phone, 'password': password},
      );
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }
}
