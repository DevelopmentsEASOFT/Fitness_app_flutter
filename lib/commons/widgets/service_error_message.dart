import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../core/features/apps_colors.dart';

class ServiceErrorMessage extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const ServiceErrorMessage({super.key, this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: AppsColors.errorColor, size: 64),
            const SizedBox(height: 16),
            Text(
              message ?? localizations.generic_error,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppsColors.secondaryColor, fontSize: 18),
            ),
            const SizedBox(height: 24),
            if (onRetry != null)
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(localizations.btn_retry),
                style: ElevatedButton.styleFrom(backgroundColor: AppsColors.errorColor, foregroundColor: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
