import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/features/app_sizes.dart';
import '../../../../core/features/apps_colors.dart';
import '../../../../core/features/button_styles.dart';
import '../../../../core/features/text_styles.dart';
import '../../../../navigation/general_navigation.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppsColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.login_title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppsColors.whiteColor, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            AppSizes.gapH16,
            LoginForm(),
            AppSizes.gapH24,
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyles.secondaryButton,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/google_icon.svg', height: 24, width: 24),
                  AppSizes.gapW12,
                  Text(l10n.login_google, style: TextStyles.buttonTextDark),
                ],
              ),
            ),
            AppSizes.gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.login_no_account, style: const TextStyle(color: AppsColors.whiteColor)),
                TextButton(
                  onPressed: () => GeneralNavigation.goToSignUp(context),
                  child: Text(
                    l10n.login_signup,
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
