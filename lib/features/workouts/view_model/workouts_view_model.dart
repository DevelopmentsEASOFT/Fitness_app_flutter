import 'package:riverpod/riverpod.dart';
import '../../../data/models/workout_details.dart';
import '../../../data/models/workout_list.dart';
import '../../../data/repository/providers/workout_repository_provider.dart';
import '../../../data/repository/workout_repository.dart';

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

class WorkoutViewModel extends StateNotifier<WorkoutState> {
  final WorkoutRepository repository;

  WorkoutViewModel(this.repository) : super(WorkoutState());

  Future<void> fetchWorkoutDetails(int workoutId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final details = await repository.getWorkoutDetails(workoutId);
      state = state.copyWith(isLoading: false, details: details, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> toggleFavoriteWorkout(int workoutId, bool isFavorite) async {
    try {
      final success = await repository.toggleFavoriteWorkout(workoutId, isFavorite);
      if (success) {
        state = state.copyWith(isFavorite: !isFavorite);
      } else {
        state = state.copyWith(error: 'No se pudo cambiar el estado de favorito');
      }
    } catch (e) {
      state = state.copyWith(error: 'No se pudo cambiar el estado de favorito');
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

final workoutViewModelProvider = StateNotifierProvider<WorkoutViewModel, WorkoutState>(
  (ref) => WorkoutViewModel(ref.read(workoutRepositoryProvider)),
);
