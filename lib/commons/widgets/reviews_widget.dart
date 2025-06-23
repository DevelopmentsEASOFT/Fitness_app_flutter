import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../core/features/apps_colors.dart';
import '../../core/features/text_styles.dart';
import '../../features/workouts/data/models/workout_review.dart';

class ReviewsWidget extends StatelessWidget {
  final List<WorkoutReview>? reviews;
  const ReviewsWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (reviews == null || reviews!.isEmpty) {
      return Center(child: Text(l10n.reviews_empty, style: TextStyles.heading2White));
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
                  (i) => const Icon(Icons.star, color: AppsColors.amberColor, size: 16),
                ),
              ),
              Text(review.comment, style: TextStyles.bodyTextWhite),
              Text(review.date, style: TextStyles.captionWhite),
            ],
          ),
        );
      },
    );
  }
}
