import 'package:dio/dio.dart';

import '../../data/models/workout_details.dart';
import '../../data/models/workout_list.dart';

class WorkoutRepository {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://and-fitness-4e047.firebaseio.com/',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<WorkoutList> getWorkouts() async {
    final response = await _dio.get('/workouts.json');
    if (response.data == null) {
      throw Exception('Workout not found');
    }

    if (response.data is List) {
      final List<dynamic> rawList = response.data;
      return WorkoutList.fromJson({'workouts': rawList.where((item) => item != null).toList()});
    }

    if (response.data is Map<String, dynamic>) {
      return WorkoutList.fromJson(response.data as Map<String, dynamic>);
    }

    throw Exception('Unexpected format for workout data');
  }

  Future<WorkoutDetails> getWorkoutDetails(int workoutId) async {
    try {
      final response = await _dio.get('/workout_details/$workoutId.json');

      if (response.data != null) {
        return WorkoutDetails.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception('Workout details not found for ID: $workoutId');
      }
    } catch (e) {
      throw Exception('Error fetching workout details: $e');
    }
  }

  Future<bool> toggleFavoriteWorkout(int workoutId, bool isFavorite) async {
    try {
      await _dio.patch('/workouts/$workoutId.json', data: {'is_favorite': isFavorite});
      return true;
    } catch (e) {
      throw Exception('Error update workout state favorite');
    }
  }
}
