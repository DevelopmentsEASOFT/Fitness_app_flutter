import 'package:riverpod/riverpod.dart';
import '../../data/models/workout_details.dart';
import '../../data/models/workout_list.dart';
import '../../domain/repositories/workout_repository.dart';

class WorkoutsViewModel extends StateNotifier<WorkoutState> {
  final WorkoutRepository repository;

  WorkoutsViewModel(this.repository) : super(WorkoutState());

  Future<void> fetchWorkoutDetails(int workoutId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final details = await repository.getWorkoutDetails(workoutId);
      state = state.copyWith(isLoading: false, details: details, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, details: null, error: null);
    }
  }

  Future<void> updateFavoriteWorkout(int workoutId, bool isFavorite) async {
    try {
      final bool favoriteUpdate = !isFavorite;
      final success = await repository.updateFavoriteWorkout(workoutId, favoriteUpdate);
      if (success) {
        state = state.copyWith(isFavorite: !isFavorite);
      }
    } catch (e) {
      state = state.copyWith(isFavorite: isFavorite);
    }
  }

  Future<void> fetchWorkouts() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final workouts = await repository.getWorkouts();
      state = state.copyWith(isLoading: false, workouts: workouts, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

class WorkoutState {
  final bool isLoading;
  final WorkoutDetails? details;
  final WorkoutList? workouts;
  final bool? isFavorite;
  final String? error;

  WorkoutState({this.isLoading = false, this.details, this.workouts, this.isFavorite, this.error});

  WorkoutState copyWith({
    bool? isLoading,
    WorkoutDetails? details,
    WorkoutList? workouts,
    bool? isFavorite,
    String? error,
  }) {
    return WorkoutState(
      isLoading: isLoading ?? this.isLoading,
      details: details ?? this.details,
      workouts: workouts ?? this.workouts,
      isFavorite: isFavorite ?? this.isFavorite,
      error: error,
    );
  }
}
