import 'workout_exercise.dart';
import 'workout_overview.dart';
import 'workout_review.dart';

class WorkoutDetails {
  final int id;
  final WorkoutOverview overview;
  final List<WorkoutExercise> exercises;
  final List<WorkoutReview> reviews;

  WorkoutDetails({required this.id, required this.overview, required this.exercises, required this.reviews});

  factory WorkoutDetails.fromJson(Map<String, dynamic> json) {
    return WorkoutDetails(
      id: json['id'],
      overview: WorkoutOverview.fromJson(json['overview']),
      exercises: (json['exercises'] as List).map((e) => WorkoutExercise.fromJson(e)).toList(),
      reviews: (json['reviews'] as List).map((e) => WorkoutReview.fromJson(e)).toList(),
    );
  }
}
