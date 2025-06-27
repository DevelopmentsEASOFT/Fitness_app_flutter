class MembershipException implements Exception {
  final String? message;
  MembershipException([this.message]);

  @override
  String toString() => 'WorkoutException: $message';
}
