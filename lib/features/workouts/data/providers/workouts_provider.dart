import 'package:riverpod/riverpod.dart';

import '../../../../core/providers/dio_provider.dart';
import '../../ui/view_model/workouts_view_model.dart';
import '../../domain/repositories/workout_repository.dart';

final workoutRepositoryProvider = Provider<WorkoutRepository>((ref) {
  final dio = ref.watch(workoutDioProvider);
  return WorkoutRepository(dio);
});

final workoutViewModelProvider = StateNotifierProvider<WorkoutsViewModel, WorkoutState>(
  (ref) => WorkoutsViewModel(ref.read(workoutRepositoryProvider)),
);
