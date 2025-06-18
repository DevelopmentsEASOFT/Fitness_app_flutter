import 'package:dio/dio.dart';

import '../models/workout_details.dart';
import '../models/workout_list.dart';

class CommonsRepository {
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

  Future<WorkoutList> getWorkouts() async {
    final response = await _dio.get('/workouts');
    return response.data != null
        ? WorkoutList.fromJson(response.data as Map<String, dynamic>)
        : throw Exception('Workout not found');
  }

  Future<WorkoutDetails> getWorkoutDetails(int workoutId) async {
    try {
      final response = await _dio.post('/workouts/details', data: {'id': workoutId});
      return WorkoutDetails.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching workout details: $e');
    }
  }

  Future<bool> toggleFavoriteWorkout(int workoutId, bool isFavorite) async {
    try {
      final response = await _dio.post('/workouts/favorite', data: {'id': workoutId, 'favorite': isFavorite});
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }
}
