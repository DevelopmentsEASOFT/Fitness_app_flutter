import 'package:fitness_gym_app/data/models/workout.dart';

class WorkoutList {
  List<Workout> workouts;

  WorkoutList({required this.workouts});

  factory WorkoutList.fromJson(Map<String, dynamic> json) {
    return WorkoutList(
      workouts: (json['workouts'] as List).map((workout) => Workout.fromJson(workout as Map<String, dynamic>)).toList(),
    );
  }
}
