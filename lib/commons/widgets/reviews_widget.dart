import 'package:fitness_gym_app/core/features/apps_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/workout_review.dart';

class ReviewsWidget extends StatelessWidget {
  final List<WorkoutReview>? reviews;
  const ReviewsWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews == null || reviews!.isEmpty) {
      return const Center(child: Text('No reviews available', style: TextStyle(color: AppsColors.secondaryColor)));
    }
    return ListView.builder(
      itemCount: reviews!.length,
      itemBuilder: (context, index) {
        final review = reviews![index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(review.user.avatarUrl)),
          title: Text(review.user.name, style: const TextStyle(color: AppsColors.whiteColor)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                  review.rating,
                  (i) => const Icon(
                    Icons.star,
                    color: AppsColors.warningColor,
                    size: 16,
                  ), //crear amber color in AppsColors
                ),
              ),
              Text(review.comment, style: const TextStyle(color: AppsColors.whiteColor)),
              Text(review.date, style: const TextStyle(color: AppsColors.grayColor, fontSize: 12)),
            ],
          ),
        );
      },
    );
  }
}
