import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/features/apps_colors.dart';
import '../../data/models/workout_exercise.dart';

class WorkoutSummaryList extends StatelessWidget {
  final List<WorkoutExercise> exercises;
  const WorkoutSummaryList({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${exercises.length + 1} ${localizations.workouts_exclusive}',
            style: TextStyle(color: AppsColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Divider(color: AppsColors.secondaryColor, thickness: 0.3, height: 0.1),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 4),
            itemCount: exercises.length,
            separatorBuilder: (context, index) => const SizedBox(height: 2),
            itemBuilder: (context, index) {
              final exercise = exercises[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(exercise.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                ),
                title: Text(
                  exercise.name,
                  style: const TextStyle(color: AppsColors.whiteColor, fontWeight: FontWeight.w600, fontSize: 18),
                ),
                subtitle:
                    exercise.detail != null
                        ? Text(exercise.detail!, style: const TextStyle(color: AppsColors.secondaryColor, fontSize: 14))
                        : null,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                dense: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
