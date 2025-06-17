import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../commons/templates/card_section_template.dart';
import '../../../commons/widgets/reviews_widget.dart';
import '../../../commons/widgets/tabs_step_custom.dart';
import '../../../core/features/apps_colors.dart';
import '../../../core/features/text_styles.dart';
import '../../../data/models/workout.dart';
import '../view_model/workouts_details_view_model.dart';
import 'widgets/workout_summary_list.dart';

class WorkoutDetailsScreen extends ConsumerStatefulWidget {
  final Workout workout;
  const WorkoutDetailsScreen({super.key, required this.workout});

  @override
  ConsumerState<WorkoutDetailsScreen> createState() => _WorkoutDetailsScreenState();
}

class _WorkoutDetailsScreenState extends ConsumerState<WorkoutDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(workoutDetailsViewModelProvider.notifier).fetchWorkoutDetails(widget.workout.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workoutDetailsViewModelProvider);

    if (state.isLoading) {
      return const Scaffold(backgroundColor: AppsColors.blackColor, body: Center(child: CircularProgressIndicator()));
    }

    if (state.error != null) {
      return Scaffold(
        backgroundColor: AppsColors.blackColor,
        body: Center(child: Text('Error: ${state.error}', style: const TextStyle(color: AppsColors.whiteColor))),
      ); //TODO: view de error
    }

    final details = state.details;
    if (details == null) {
      return const Scaffold(
        backgroundColor: AppsColors.blackColor,
        body: Center(child: Text('No data', style: TextStyle(color: AppsColors.whiteColor))),
      ); //TODO: view de error
    }

    final isFavorite = state.isFavorite ?? details.overview.isFavorite;

    return Scaffold(
      backgroundColor: AppsColors.blackColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CardSectionTemplate(
            imageCard: Image.network(details.overview.imageUrl, fit: BoxFit.cover, alignment: Alignment.centerLeft),
            onFavorite: () {
              ref.read(workoutDetailsViewModelProvider.notifier).toggleFavoriteWorkout(widget.workout.id, isFavorite);
            },
            isFavorite: isFavorite,
            returnBack: () => Navigator.pop(context),
            bottomDetailCard: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: details.overview.isPremium ? Colors.amber : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                details.overview.isPremium ? 'Premium' : 'Standard',
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: TabsStepCustom(
              headerTile: details.overview.title,
              tabsHeader: const [Tab(text: 'Details'), Tab(text: 'Workouts'), Tab(text: 'Reviews')],
              stepTabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: Image.network(details.overview.trainer.avatarUrl, width: 90, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 16),
                          Text(details.overview.trainer.name, style: TextStyles.heading2White),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(details.overview.description, style: TextStyles.bodyTextWhite),
                    ],
                  ),
                ),
                WorkoutSummaryList(exercises: details.exercises),
                ReviewsWidget(reviews: details.reviews),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: const Icon(Icons.chat, color: AppsColors.whiteColor, size: 35),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: AppsColors.errorColor, shape: BoxShape.circle),
                        child: Text(
                          '${details.reviews.length}',
                          style: const TextStyle(color: AppsColors.whiteColor, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppsColors.primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: Text('Start Workouts', style: TextStyles.buttonText),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
