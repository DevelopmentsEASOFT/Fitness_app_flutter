import 'package:flutter/material.dart';

class Workout {
  final int id;
  final bool isFavorite;
  final String title;
  final String trainer;
  final String imageUrl;
  final String type;
  final String typeColor;
  final int messages;

  Workout({
    required this.id,
    required this.isFavorite,
    required this.title,
    required this.trainer,
    required this.imageUrl,
    required this.type,
    required this.typeColor,
    required this.messages,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'] as int,
      isFavorite: json['is_favorite'] as bool? ?? false,
      title: json['title'] as String,
      trainer: json['trainer'] as String,
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
      typeColor: json['typeColor'] as String,
      messages: json['messages'] as int,
    );
  }

  Color get typeColorValue {
    return Color(int.parse(typeColor.replaceFirst('#', '0xff')));
  }
}
