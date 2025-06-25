import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/features/apps_colors.dart';
import '../../../../../core/features/box_space.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppsColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoxSpace.gapH16,
            Text(
              localizations.signup_title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppsColors.whiteColor, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SignUpForm(),
            BoxSpace.gapH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(localizations.signup_already_registered, style: const TextStyle(color: AppsColors.whiteColor)),
                TextButton(
                  onPressed: () => context.pushNamed(AppRoutes.signUp),
                  child: Text(
                    localizations.signup_signin,
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
