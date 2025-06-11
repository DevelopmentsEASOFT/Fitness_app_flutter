import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/features/app_sizes.dart';
import '../../../core/features/text_styles.dart';
import '../../../data/models/workout_home.dart';
import '../../../navigation/general_navigation.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key, required this.workoutList});

  final Future<WorkoutHome> workoutList;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FutureBuilder<WorkoutHome>(
      future: workoutList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text(l10n.workouts_error, style: TextStyles.bodyTextWhite));
        } else if (!snapshot.hasData || snapshot.data!.workouts.isEmpty) {
          return Center(child: Text(l10n.workouts_empty, style: TextStyles.bodyTextWhite));
        }
        final workouts = snapshot.data?.workouts ?? [];

        return ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            final workout = workouts[index];
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
      },
    );
  }
}
