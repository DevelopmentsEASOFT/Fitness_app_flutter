import 'package:flutter/material.dart';

class Workout {
  final int id;
  final String title;
  final String trainer;
  final String imageUrl;
  final String type; // e.g., "Premium" or "Free"
  final String typeColor; // Hex color string, e.g., "#FFD600"
  final int messages;

  Workout({
    required this.id,
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
      title: json['title'] as String,
      trainer: json['trainer'] as String,
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
      typeColor: json['typeColor'] as String,
      messages: json['messages'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'trainer': trainer,
      'imageUrl': imageUrl,
      'type': type,
      'typeColor': typeColor,
      'messages': messages,
    };
  }

  Color get typeColorValue {
    return Color(int.parse(typeColor.replaceFirst('#', '0xff')));
  }
}
