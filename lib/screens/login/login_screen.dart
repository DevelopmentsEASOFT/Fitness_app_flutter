import 'package:fitness_gym_app/components/input_field_custom.dart';
import 'package:fitness_gym_app/components/primary_elevanted_button_custom.dart';
import 'package:fitness_gym_app/core/features/button_styles.dart';
import 'package:fitness_gym_app/core/features/text_styles.dart';
import 'package:fitness_gym_app/navigation/general_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          InputFieldCustom(
            icon: Icons.person,
            hint: l10n.login_username_hint,
            obscureText: false,
            suffixIcon: Icons.check_circle,
          ),
          const SizedBox(height: 16),
          InputFieldCustom(
            icon: Icons.lock,
            hint: l10n.login_password_hint,
            obscureText: true,
            suffixIcon: Icons.visibility_off,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(l10n.login_forgot_password, style: const TextStyle(color: Colors.white70)),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: PrimaryElevantedButtonCustom(
              onPressed: () => GeneralNavigation.goToHome(context),
              text: l10n.login_button,
              isLoading: false,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyles.secondaryButton,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/google_icon.svg', height: 24, width: 24),
                const SizedBox(width: 12),
                Text(l10n.login_google, style: TextStyles.buttonTextDark),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.login_no_account, style: const TextStyle(color: Colors.white70)),
              TextButton(
                onPressed: () => GeneralNavigation.goToSignUp(context),
                child: Text(
                  l10n.login_signup,
                  style: const TextStyle(color: Color(0xFFB388FF), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
