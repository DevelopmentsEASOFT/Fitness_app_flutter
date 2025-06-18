import 'trainer.dart';

class WorkoutOverview {
  final String title;
  final Trainer trainer;
  final int exercisesCount;
  final bool isFavorite;
  final String duration;
  final String level;
  final String description;
  final bool isPremium;
  final double rating;
  final int reviewsCount;
  final bool consultationAvailable;
  final String imageUrl;

  WorkoutOverview({
    required this.title,
    required this.trainer,
    required this.exercisesCount,
    required this.isFavorite,
    required this.duration,
    required this.level,
    required this.description,
    required this.isPremium,
    required this.rating,
    required this.reviewsCount,
    required this.consultationAvailable,
    required this.imageUrl,
  });

  factory WorkoutOverview.fromJson(Map<String, dynamic> json) {
    return WorkoutOverview(
      title: json['title'],
      trainer: Trainer.fromJson(json['trainer']),
      exercisesCount: json['exercisesCount'],
      isFavorite: json['isFavorite'],
      duration: json['duration'],
      level: json['level'],
      description: json['description'],
      isPremium: json['isPremium'],
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'],
      consultationAvailable: json['consultationAvailable'],
      imageUrl: json['imageUrl'],
    );
  }
}
