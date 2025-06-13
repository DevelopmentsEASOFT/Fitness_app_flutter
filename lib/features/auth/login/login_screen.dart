import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../commons/widgets/input_field_custom.dart';
import '../../../commons/widgets/primary_elevated_button_custom.dart';
import '../../../core/features/app_sizes.dart';
import '../../../core/features/apps_colors.dart';
import '../../../core/features/button_styles.dart';
import '../../../core/features/text_styles.dart';
import '../../../navigation/general_navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.login_title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppsColors.whiteColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          AppSizes.gapH16,
          InputFieldCustom(
            icon: Icons.person,
            hint: l10n.login_username_hint,
            obscureText: false,
            suffixIcon: Icons.check_circle,
          ),
          AppSizes.gapH16,
          InputFieldCustom(
            icon: Icons.lock,
            hint: l10n.login_password_hint,
            obscureText: true,
            suffixIcon: Icons.visibility_off,
          ),
          AppSizes.gapH16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(l10n.login_forgot_password, style: const TextStyle(color: AppsColors.whiteColor)),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: PrimaryElevatedButtonCustom(
              onPressed: () => GeneralNavigation.goToHome(context),
              text: l10n.login_button,
              isLoading: false,
            ),
          ),
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
    );
  }
}
