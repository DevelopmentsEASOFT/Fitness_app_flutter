import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../commons/widgets/service_error.dart';
import '../../../../config/router/app_routes.dart';
import '../../../../core/features/app_sizes.dart';
import '../../../../core/features/apps_colors.dart';
import '../../../../core/features/text_styles.dart';
import '../../data/providers/workouts_provider.dart';

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
    final localizations = AppLocalizations.of(context)!;

    final state = ref.watch(workoutViewModelProvider);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return ServiceError();
    }
    final workoutsList = state.workouts;
    if (workoutsList == null || workoutsList.workouts.isEmpty) {
      return ServiceError();
    }

    return ListView.builder(
      itemCount: workoutsList.workouts.length,
      itemBuilder: (context, index) {
        final workout = workoutsList.workouts[index];
        return GestureDetector(
          onTap: () {
            context.pushNamed(AppRoutes.workoutDetail, extra: workout);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: workout.type == 'Premium' ? AppsColors.amberColor : AppsColors.secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      workout.type.toUpperCase(),
                      style: const TextStyle(color: AppsColors.grayColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  AppSizes.gapH50,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(workout.title, style: TextStyles.heading1White),
                          Text(localizations.workouts_trainer(workout.trainer), style: TextStyles.bodyTextWhite),
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
