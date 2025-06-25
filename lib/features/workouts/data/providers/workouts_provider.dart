import 'package:riverpod/riverpod.dart';

import '../../ui/view_model/workouts_view_model.dart';
import '../../domain/repositories/workout_repository.dart';

final workoutRepositoryProvider = Provider<WorkoutRepository>((ref) => WorkoutRepository());

final workoutViewModelProvider = StateNotifierProvider<WorkoutsViewModel, WorkoutState>(
  (ref) => WorkoutsViewModel(ref.read(workoutRepositoryProvider)),
);
