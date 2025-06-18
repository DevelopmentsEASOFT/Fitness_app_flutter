class WorkoutExercise {
  final String imageUrl;
  final String name;
  final String? detail; // e.g., "20x" or "02:00"

  WorkoutExercise({required this.imageUrl, required this.name, this.detail});

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) {
    return WorkoutExercise(
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      detail: json['detail'] as String?,
    );
  }
}
