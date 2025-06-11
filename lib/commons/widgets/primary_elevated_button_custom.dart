import 'package:flutter/material.dart';

import '../../core/features/button_styles.dart';

class PrimaryElevatedButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const PrimaryElevatedButtonCustom({super.key, required this.text, required this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyles.primaryButton,
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
