import 'package:fitness_gym_app/data/models/workout.dart';

class WorkoutHome {
  List<Workout> workouts;

  WorkoutHome({required this.workouts});

  factory WorkoutHome.fromJson(Map<String, dynamic> json) {
    return WorkoutHome(
      workouts: (json['workouts'] as List).map((workout) => Workout.fromJson(workout as Map<String, dynamic>)).toList(),
    );
  }
}
