import 'package:dio/dio.dart';

import '../models/workout_details.dart';
import '../models/workout_home.dart';

class Repository {
  final _dio = Dio();

  Future<bool> doLogin(String username, String password) async {
    try {
      final response = await _dio.post(
        'http://localhost:3002/login',
        data: {'username': username, 'password': password},
      );
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
        'http://localhost:3002/signup',
        data: {'name': name, 'email': email, 'phone': phone, 'password': password},
      );
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }

  Future<WorkoutHome> getWorkout() async {
    final response = await _dio.get('http://localhost:3002/workouts/');
    return response.data != null
        ? WorkoutHome.fromJson(response.data as Map<String, dynamic>)
        : throw Exception('Workout not found');
  }

  Future<WorkoutDetails> getWorkoutDetails(int workoutId) async {
    try {
      final response = await _dio.post('http://localhost:3002/workouts/details', data: {'id': workoutId});
      return WorkoutDetails.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching workout details: $e');
    }
  }

  Future<bool> toggleFavoriteWorkout(int workoutId, bool isFavorite) async {
    try {
      final response = await _dio.post(
        'http://localhost:3002/workouts/favorite',
        data: {'id': workoutId, 'favorite': isFavorite},
      );
      return response.data['success'] == true;
    } catch (e) {
      return false;
    }
  }
}
