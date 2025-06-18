import 'package:fitness_gym_app/core/features/apps_colors.dart';
import 'package:flutter/material.dart';

class ServiceErrorView extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const ServiceErrorView({super.key, this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: AppsColors.errorColor, size: 64),
            const SizedBox(height: 16),
            Text(
              message ?? 'An unexpected error occurred.\nPlease try again.', //Todo: Localize this message
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppsColors.secondaryColor, fontSize: 18),
            ),
            const SizedBox(height: 24),
            if (onRetry != null)
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(backgroundColor: AppsColors.errorColor, foregroundColor: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
