import 'package:riverpod/riverpod.dart';

import '../../../features/workouts/view_model/workouts_view_model.dart';
import '../workout_repository.dart';

final workoutRepositoryProvider = Provider<WorkoutRepository>((ref) => WorkoutRepository());

final workoutViewModelProvider = StateNotifierProvider<WorkoutViewModel, WorkoutState>(
  (ref) => WorkoutViewModel(ref.read(workoutRepositoryProvider)),
);
