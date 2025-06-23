import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../core/features/apps_colors.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              text: l10n.signup_terms_prefix,
              style: const TextStyle(color: AppsColors.whiteColor, fontSize: 12),
              children: [
                TextSpan(
                  text: l10n.signup_terms_terms,
                  style: const TextStyle(
                    color: AppsColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(text: l10n.signup_terms_and, style: const TextStyle(color: AppsColors.whiteColor)),
                TextSpan(
                  text: l10n.signup_terms_privacy,
                  style: const TextStyle(
                    color: AppsColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
