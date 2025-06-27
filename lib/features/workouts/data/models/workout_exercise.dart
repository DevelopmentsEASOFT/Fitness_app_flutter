class WorkoutExercise {
  final String imageUrl;
  final String name;
  final String? detail;
  final String? duration;

  WorkoutExercise({required this.imageUrl, required this.name, this.detail, required this.duration});

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) {
    return WorkoutExercise(
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
      detail: json['detail'] as String?,
      duration: json['duration'] as String?,
    );
  }

  Duration get durationExercise {
    if (duration == null || duration!.isEmpty) {
      return Duration.zero;
    }
    final parts = duration!.split(':');
    if (parts.length == 2) {
      final minutes = int.tryParse(parts[0]) ?? 0;
      final seconds = int.tryParse(parts[1]) ?? 0;
      return Duration(minutes: minutes, seconds: seconds);
    } else if (parts.length == 1) {
      final seconds = int.tryParse(parts[0]) ?? 0;
      return Duration(seconds: seconds);
    }
    return Duration.zero;
  }
}
