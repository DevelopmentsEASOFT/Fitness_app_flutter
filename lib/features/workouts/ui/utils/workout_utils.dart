import '../../data/models/workout_exercise.dart';

class WorkoutUtils {
  static String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  static Duration getTotalTimeWorkout(List<WorkoutExercise> list) {
    return list.fold<Duration>(Duration.zero, (total, workout) => total + workout.durationExercise);
  }
}
