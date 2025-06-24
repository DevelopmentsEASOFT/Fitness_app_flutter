import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/features/apps_colors.dart';
import '../../core/features/text_styles.dart';

class UnderConstruction extends StatelessWidget {
  final String? message;

  const UnderConstruction({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.construction, color: AppsColors.amberColor, size: 44),
            const SizedBox(height: 16),
            Text(
              message ?? localizations.txt_under_construction,
              textAlign: TextAlign.center,
              style: TextStyles.heading2White,
            ),
          ],
        ),
      ),
    );
  }
}
