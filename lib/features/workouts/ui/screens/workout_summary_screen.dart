import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/features/apps_colors.dart';
import '../../data/models/workout_details.dart';
import '../../data/models/workout_exercise.dart';
import '../../data/providers/workouts_provider.dart';
import '../utils/workout_utils.dart';

class WorkoutSummaryScreen extends ConsumerWidget {
  final int calories;
  final int bpm;
  final int points;
  final List<WorkoutExercise>? exercisesWorkoutCompleted;

  const WorkoutSummaryScreen({
    super.key,
    required this.calories,
    required this.bpm,
    required this.points,
    required this.exercisesWorkoutCompleted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WorkoutDetails? exercisesworkout = ref.watch(workoutViewModelProvider).details;
    final totalTime = WorkoutUtils.getTotalTimeWorkout(exercisesworkout?.exercises ?? []);
    final elapsedTime = WorkoutUtils.getTotalTimeWorkout(exercisesWorkoutCompleted ?? []);
    final percent = totalTime.inMinutes > 0 ? elapsedTime.inMinutes / totalTime.inMinutes : 0.0;
    final userName = 'Andres Esquivel';

    return Scaffold(
      backgroundColor: AppsColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppsColors.blackColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppsColors.whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            'Nice Job, $userName!',
            style: const TextStyle(color: AppsColors.whiteColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'You just finished your cardio workout set',
            style: TextStyle(color: AppsColors.whiteColor, fontSize: 16),
          ),
          const SizedBox(height: 24),
          // Circular progress
          SizedBox(
            height: 180,
            width: 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 180,
                  width: 180,
                  child: CircularProgressIndicator(
                    value: percent,
                    strokeWidth: 10,
                    backgroundColor: AppsColors.grayColor,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppsColors.amberColor),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      WorkoutUtils.formatDuration(elapsedTime),
                      style: const TextStyle(color: AppsColors.whiteColor, fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'of ${totalTime.inMinutes} total',
                      style: const TextStyle(color: AppsColors.whiteColor, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatItem(
                  icon: Icons.local_fire_department,
                  color: AppsColors.amberColor,
                  value: '$calories cal',
                  label: 'Burned',
                ),
                _StatItem(icon: Icons.favorite, color: AppsColors.blueColor, value: '$bpm bpm', label: 'Average'),
                _StatItem(icon: Icons.diamond, color: AppsColors.successColor, value: '+$points', label: 'Points'),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Finished workout list
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppsColors.blackColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(color: AppsColors.grayColor, borderRadius: BorderRadius.circular(2)),
                      ),
                    ),
                    const Text(
                      'Finished workout',
                      style: TextStyle(color: AppsColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.separated(
                        itemCount: exercisesWorkoutCompleted?.length ?? 0,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final ex = exercisesWorkoutCompleted?[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: AppsColors.blackColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ListTile(
                              title: Text(
                                ex?.name ?? '',
                                style: const TextStyle(color: AppsColors.whiteColor, fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(ex?.duration ?? '', style: const TextStyle(color: AppsColors.whiteColor)),
                              trailing: const Icon(Icons.check, color: AppsColors.whiteColor),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String label;

  const _StatItem({required this.icon, required this.color, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: AppsColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(color: AppsColors.grayColor, fontSize: 14)),
      ],
    );
  }
}
