import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _baseOptions = BaseOptions(
  connectTimeout: const Duration(milliseconds: 5000),
  receiveTimeout: const Duration(milliseconds: 3000),
  headers: {'Content-Type': 'application/json'},
);

final authDioProvider = Provider<Dio>((ref) {
  return Dio(_baseOptions.copyWith(baseUrl: 'http://localhost:3002'));
});

final membershipDioProvider = Provider<Dio>((ref) {
  return Dio(_baseOptions.copyWith(baseUrl: 'https://and-fitness-member-ship.firebaseio.com/membership_users/'));
});

final workoutDioProvider = Provider<Dio>((ref) {
  return Dio(_baseOptions.copyWith(baseUrl: 'https://and-fitness-4e047.firebaseio.com/'));
});
