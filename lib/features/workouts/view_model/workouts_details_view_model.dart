import 'package:riverpod/riverpod.dart';
import '../../../data/models/workout_details.dart';
import '../../../data/repository/provider.dart/repository_provider.dart';
import '../../../data/repository/repository.dart';

// Define los posibles estados
class WorkoutDetailsState {
  final bool isLoading;
  final WorkoutDetails? details;
  final bool? isFavorite;
  final String? error;

  WorkoutDetailsState({this.isLoading = false, this.details, this.isFavorite, this.error});

  WorkoutDetailsState copyWith({bool? isLoading, WorkoutDetails? details, bool? isFavorite, String? error}) {
    return WorkoutDetailsState(
      isLoading: isLoading ?? this.isLoading,
      details: details ?? this.details,
      isFavorite: isFavorite ?? this.isFavorite,
      error: error,
    );
  }
}

class WorkoutDetailsViewModel extends StateNotifier<WorkoutDetailsState> {
  final Repository repository;

  WorkoutDetailsViewModel(this.repository) : super(WorkoutDetailsState());

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
}

final workoutDetailsViewModelProvider = StateNotifierProvider<WorkoutDetailsViewModel, WorkoutDetailsState>(
  (ref) => WorkoutDetailsViewModel(ref.read(repositoryProvider)),
);
