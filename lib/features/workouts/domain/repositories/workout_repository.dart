import 'package:dio/dio.dart';
import '../../../../core/api/api_endpoints.dart';
import '../../data/models/workout_details.dart';
import '../../data/models/workout_list.dart';
import '../exceptions/workout_exception.dart';

class WorkoutRepository {
  const WorkoutRepository(this._dio);
  final Dio _dio;

  Future<WorkoutList> getWorkouts() async {
    final response = await _dio.get(ApiEndpoints.workouts);
    if (response.data == null) {
      throw WorkoutException('Workout not found');
    }

    if (response.data is List) {
      final List<dynamic> rawList = response.data;
      return WorkoutList.fromJson({'workouts': rawList.where((item) => item != null).toList()});
    }

    if (response.data is Map<String, dynamic>) {
      return WorkoutList.fromJson(response.data as Map<String, dynamic>);
    }

    throw WorkoutException('Unexpected format for workout data');
  }

  Future<WorkoutDetails> getWorkoutDetails(int workoutId) async {
    try {
      final response = await _dio.get(ApiEndpoints.workoutDetails(workoutId));

      if (response.data != null) {
        return WorkoutDetails.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw WorkoutException('Workout details not found for ID: $workoutId');
      }
    } catch (e) {
      throw WorkoutException('Error fetching workout details: $e');
    }
  }

  Future<bool> updateFavoriteWorkout(int workoutId, bool isFavorite) async {
    try {
      await _dio.patch(ApiEndpoints.workout(workoutId), data: {'is_favorite': isFavorite});
      return true;
    } catch (e) {
      throw WorkoutException('Error update workout state favorite');
    }
  }
}
