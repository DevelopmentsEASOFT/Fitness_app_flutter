import 'package:riverpod/riverpod.dart';

import '../workout_repository.dart';

final workoutRepositoryProvider = Provider<WorkoutRepository>((ref) => WorkoutRepository());
