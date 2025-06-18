import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../commons/templates/service_error_view.dart';
import '../../../../core/features/app_sizes.dart';
import '../../../../core/features/text_styles.dart';
import '../../../../navigation/general_navigation.dart';
import '../../view_model/workouts_view_model.dart';

class WorkoutList extends ConsumerStatefulWidget {
  const WorkoutList({super.key});

  @override
  ConsumerState<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends ConsumerState<WorkoutList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(workoutViewModelProvider.notifier).fetchWorkouts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final state = ref.watch(workoutViewModelProvider);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return ServiceErrorView();
    }
    final workoutsList = state.workouts;
    if (workoutsList == null || workoutsList.workouts.isEmpty) {
      return ServiceErrorView();
    }

    return ListView.builder(
      itemCount: workoutsList.workouts.length,
      itemBuilder: (context, index) {
        final workout = workoutsList.workouts[index];
        return GestureDetector(
          onTap: () {
            GeneralNavigation.goToWorkoutDetails(context, workout);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(image: AssetImage('assets/images/workout_gym.jpg'), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    workout.type == "Premium" ? l10n.workouts_type_premium : l10n.workouts_type_free,
                    style: TextStyles.bodyTextWhite,
                  ),
                  AppSizes.gapH50,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(workout.title, style: TextStyles.heading1White),
                          Text(l10n.workouts_trainer(workout.trainer), style: TextStyles.bodyTextWhite),
                        ],
                      ),
                      const Icon(Icons.favorite, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
