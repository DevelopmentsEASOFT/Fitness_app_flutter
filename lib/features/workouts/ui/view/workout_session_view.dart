import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/features/app_sizes.dart';
import '../../../../core/features/apps_colors.dart';
import '../../../../core/features/text_styles.dart';
import '../../data/models/workout_exercise.dart';
import '../../data/providers/workouts_provider.dart';
import '../../../../navigation/general_navigation.dart';
import '../view_model/workouts_view_model.dart';

class WorkoutSessionView extends ConsumerStatefulWidget {
  const WorkoutSessionView({super.key});

  @override
  ConsumerState<WorkoutSessionView> createState() => _WorkoutDetailsScreenState();
}

class _WorkoutDetailsScreenState extends ConsumerState<WorkoutSessionView> {
  late int currentStep;
  Timer? _timer;
  Duration remainingDuration = Duration(minutes: 3);
  bool isPaused = false;
  late Duration _originalStepDuration;
  List<WorkoutExercise> exercisesWorkoutCompleted = [];

  @override
  void initState() {
    super.initState();
    currentStep = 0;
    final firstExercise =
        ref.read(workoutViewModelProvider).details?.exercises.isNotEmpty == true
            ? ref.read(workoutViewModelProvider).details!.exercises[0]
            : null;
    _startStepTimer(firstExercise?.durationExercise ?? Duration(minutes: 3));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startStepTimer(Duration stepDuration) {
    final exercises = ref.read(workoutViewModelProvider).details?.exercises;
    final currentExercise = exercises != null && currentStep < exercises.length ? exercises[currentStep] : null;
    remainingDuration = currentExercise?.durationExercise ?? Duration(minutes: 3);
    _originalStepDuration = stepDuration;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isPaused) return;

      setState(() {
        if (remainingDuration.inSeconds <= 1) {
          if (currentExercise != null && !exercisesWorkoutCompleted.contains(currentExercise)) {
            exercisesWorkoutCompleted.add(currentExercise);
          }
          currentStep++;
          if (currentStep < (exercises?.length ?? 0)) {
            final nextExercise = exercises?[currentStep];
            remainingDuration = nextExercise?.durationExercise ?? Duration(minutes: 3);
          } else {
            _timer?.cancel();
          }
        } else {
          remainingDuration = Duration(seconds: remainingDuration.inSeconds - 1);
        }
      });
    });
  }

  void _pauseOrResume() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  void _goToStep(int index) {
    setState(() {
      currentStep = index;
    });
    final currentExercise = ref.read(workoutViewModelProvider).details?.exercises[index];
    _startStepTimer(currentExercise?.durationExercise ?? Duration(minutes: 2));
  }

  double get _currentStepProgress {
    if (_originalStepDuration.inSeconds == 0) return 0.0;
    final elapsed = _originalStepDuration.inSeconds - remainingDuration.inSeconds;
    return elapsed / _originalStepDuration.inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    final WorkoutState state = ref.watch(workoutViewModelProvider);
    final List<WorkoutExercise>? exercisesWorkout = state.details?.exercises;
    final currentExercise = exercisesWorkout?[currentStep];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 500,
            child: Image.network(
              currentExercise?.imageUrl ?? 'https://via.placeholder.com/800',
              fit: BoxFit.fill,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
              alignment: Alignment.bottomCenter,
            ),
          ),

          Align(alignment: Alignment.bottomCenter, child: Container(height: 100, color: Colors.black)),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 40),
                      Text('Session 1/3', style: TextStyles.headerTextWhite),
                      IconButton(icon: const Icon(Icons.more_horiz, color: Colors.white), onPressed: () {}),
                    ],
                  ),
                ),
                AppSizes.gapH50,
                Text(
                  _formatDuration(remainingDuration),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${currentExercise?.name} ${currentExercise?.detail ?? (currentExercise?.duration ?? '03:00')}',
                  style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(icon: const Icon(Icons.replay_10, color: Colors.white, size: 32), onPressed: () {}),
                    Container(
                      decoration: const BoxDecoration(color: Color(0xFF7B61FF), shape: BoxShape.circle),
                      child: IconButton(
                        icon: Icon(isPaused ? Icons.play_arrow : Icons.pause, color: Colors.white, size: 36),
                        onPressed: _pauseOrResume,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, color: Colors.white, size: 32),
                      onPressed:
                          () => _goToStep(
                            currentStep + 1 < (exercisesWorkout?.length ?? 0) ? currentStep + 1 : currentStep,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                // Workout list
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Workout list',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                              itemCount: exercisesWorkout?.length,
                              itemBuilder: (context, index) {
                                final step = exercisesWorkout?[index];
                                final isCurrent = currentStep == index;
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    color:
                                        isCurrent ? const Color(0xFFFA7268).withOpacity(0.85) : const Color(0xFF232323),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: ListTile(
                                    leading:
                                        isCurrent
                                            ? Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 48,
                                                  height: 48,
                                                  child: CircularProgressIndicator(
                                                    value: _currentStepProgress,
                                                    backgroundColor: Colors.white24,
                                                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                                                  ),
                                                ),
                                                Text(
                                                  '${(_currentStepProgress * 100).toInt()}%',
                                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                                ),
                                              ],
                                            )
                                            : null,
                                    title: Text(
                                      '${step?.name}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ),
                                    subtitle: Text(
                                      step?.detail ?? (step?.duration ?? '03:00'),
                                      style: const TextStyle(color: Colors.white70),
                                    ),
                                    trailing: Icon(Icons.play_arrow, color: isCurrent ? Colors.white : Colors.white54),
                                    onTap: () => _goToStep(index),
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
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppsColors.errorlightColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed:
                            () => GeneralNavigation.goToWorkoutSessionSummary(
                              context,
                              exercisesWorkoutCompleted: exercisesWorkoutCompleted,
                            ),
                        child: Text('End Session', style: TextStyles.buttonText),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

class WorkoutStep {
  final String title;
  final String repsOrTime;
  final String time;
  final String imageUrl;

  WorkoutStep({required this.title, required this.repsOrTime, required this.time, required this.imageUrl});
}
