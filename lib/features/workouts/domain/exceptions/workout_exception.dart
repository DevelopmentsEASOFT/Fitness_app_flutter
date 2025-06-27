class WorkoutException implements Exception {
  final String? message;
  WorkoutException([this.message]);

  @override
  String toString() => 'WorkoutException: $message';
}
