import 'package:flutter/material.dart';

import '../../core/features/apps_colors.dart';
import '../../core/features/button_styles.dart';

class PrimaryElevatedButtonCustom extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool isLoading;

  const PrimaryElevatedButtonCustom({super.key, required this.text, required this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyles.primaryButton,
      onPressed: isLoading ? null : onPressed,
      child:
          isLoading
              ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(color: AppsColors.whiteColor, strokeWidth: 2),
              )
              : Text(
                text,
                style: const TextStyle(color: AppsColors.whiteColor, fontSize: 18, fontWeight: FontWeight.bold),
              ),
    );
  }
}
