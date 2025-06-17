import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/features/app_sizes.dart';
import '../../../core/features/apps_colors.dart';
import '../../../navigation/general_navigation.dart';
import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppsColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSizes.gapH16,
            Text(
              l10n.signup_title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppsColors.whiteColor, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SignUpForm(),
            AppSizes.gapH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.signup_already_registered, style: const TextStyle(color: AppsColors.whiteColor)),
                TextButton(
                  onPressed: () => GeneralNavigation.goToLogin(context),
                  child: Text(
                    l10n.signup_signin,
                    style: const TextStyle(color: AppsColors.primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
