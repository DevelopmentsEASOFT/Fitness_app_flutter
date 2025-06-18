import 'package:dio/dio.dart';

class AuthRepository {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3002',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<bool> doLogin(String username, String password) async {
    try {
      final response = await _dio.post('/login', data: {'username': username, 'password': password});
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> doSignUp({
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
