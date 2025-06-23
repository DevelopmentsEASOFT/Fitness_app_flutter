import 'review_user.dart';

class WorkoutReview {
  final ReviewUser user;
  final int rating;
  final String comment;
  final String date;

  WorkoutReview({required this.user, required this.rating, required this.comment, required this.date});

  factory WorkoutReview.fromJson(Map<String, dynamic> json) {
    return WorkoutReview(
      user: ReviewUser.fromJson(json['user']),
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
    );
  }
}
