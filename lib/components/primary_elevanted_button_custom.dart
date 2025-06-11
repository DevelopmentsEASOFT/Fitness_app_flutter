import 'package:fitness_gym_app/core/features/button_styles.dart';
import 'package:flutter/material.dart';

class PrimaryElevantedButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const PrimaryElevantedButtonCustom({super.key, required this.text, required this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyles.primaryButton,
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
