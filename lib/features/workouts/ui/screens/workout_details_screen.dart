import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../commons/widgets/card_section.dart';
import '../../../../commons/widgets/service_error.dart';
import '../../../../commons/widgets/reviews_list.dart';
import '../../../../commons/widgets/tabs_step_custom.dart';
import '../../../../config/router/app_routes.dart';
import '../../../../core/features/apps_colors.dart';
import '../../../../core/features/text_styles.dart';
import '../../data/models/workout.dart';
import '../../data/models/workout_details.dart';
import '../../data/providers/workouts_provider.dart';
import '../view_model/workouts_view_model.dart';
import '../widgets/workout_details_skeleton.dart';
import '../widgets/workout_summary_list.dart';

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
      ref.read(workoutViewModelProvider.notifier).fetchWorkoutDetails(widget.workout.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final WorkoutState state = ref.watch(workoutViewModelProvider);

    final WorkoutDetails? details = state.details;
    final bool? isFavorite = state.isFavorite ?? details?.overview.isFavorite;
    return Scaffold(
      backgroundColor: AppsColors.blackColor,
      body:
          state.isLoading
              ? WorkoutDetailsSkeleton()
              : state.error != null || details == null
              ? ServiceError()
              : WorkoutDetailsContent(details: details, ref: ref, idWorkout: widget.workout.id, isFavorite: isFavorite),
    );
  }
}

class WorkoutDetailsContent extends StatelessWidget {
  const WorkoutDetailsContent({
    super.key,
    required this.details,
    required this.ref,
    required this.idWorkout,
    required this.isFavorite,
  });

  final WorkoutDetails? details;
  final WidgetRef ref;
  final int idWorkout;
  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        CardSection(
          imageCard: Image.network(details!.overview.imageUrl, fit: BoxFit.cover, alignment: Alignment.centerLeft),
          onFavorite: () {
            ref.read(workoutViewModelProvider.notifier).toggleFavoriteWorkout(idWorkout, isFavorite ?? false);
          },
          isFavorite: isFavorite,
          returnBack: () => Navigator.pop(context),
          bottomDetailCard: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: details!.overview.isPremium ? AppsColors.amberColor : AppsColors.grayColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              details!.overview.isPremium ? localizations.workouts_type_premium : localizations.workouts_type_free,
              style: const TextStyle(color: AppsColors.grayColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        TabsStepCustom(
          headerTile: details!.overview.title,
          tabsHeader: const [
            Tab(text: 'Obverview'),
            Tab(text: 'Workout List'),
            Tab(text: 'Reviews'),
          ], //TODO: Localize this
          stepTabs: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: AppsColors.grayColor, height: 0.2, thickness: 0.2),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppsColors.grayColor, size: 20),
                      SizedBox(width: 8),
                      Text(details!.overview.level, style: TextStyles.heading3White),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.timer, color: AppsColors.grayColor, size: 20),
                      SizedBox(width: 6),
                      Text(details!.overview.duration, style: TextStyles.heading3White),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Divider(color: AppsColors.grayColor, height: 0.2, thickness: 0.2),
                  Text(details!.overview.description, style: TextStyles.bodyTextWhite),
                  const SizedBox(height: 8),
                  Divider(color: AppsColors.grayColor, height: 0.2, thickness: 0.2),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.asset(
                          "assets/images/start_gym.png",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ), //Image.network(details!.overview.trainer.avatarUrl, width: 90, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        children: [
                          Text(details!.overview.trainer.name, style: TextStyles.heading2White),
                          Text(localizations.workouts_label, style: TextStyles.captionWhite),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: WorkoutSummaryList(exercises: details!.exercises),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: ReviewsList(reviews: details!.reviews),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppsColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => context.pushNamed(AppRoutes.workoutStart, extra: details),
                  child: Text('Start Workouts', style: TextStyles.buttonText),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
