import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../commons/widgets/primary_elevated_button_custom.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSizes.gapH16,
          Text(
            l10n.signup_title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppsColors.whiteColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SignUpForm(),
          Row(
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
          ),
          AppSizes.gapH24,
          SizedBox(
            width: double.infinity,
            height: 54,
            child: PrimaryElevatedButtonCustom(onPressed: () {}, text: l10n.signup_button, isLoading: false),
          ),
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
    );
  }
}
