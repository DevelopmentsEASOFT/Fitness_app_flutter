import 'package:dio/dio.dart';
import 'package:fitness_gym_app/data/models/workout_home.dart';

class Repository {
  final _dio = Dio();

  Future<WorkoutHome> getWorkout() async {
    final response = await _dio.get('http://localhost:3002/workouts/');
    return response.data != null
        ? WorkoutHome.fromJson(response.data as Map<String, dynamic>)
        : throw Exception('Workout not found');
  }
}
