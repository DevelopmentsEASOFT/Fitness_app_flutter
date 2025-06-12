import 'package:fitness_gym_app/components/primary_elevanted_button_custom.dart';
import 'package:fitness_gym_app/navigation/general_navigation.dart';
import 'package:fitness_gym_app/screens/sing_up/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            l10n.signup_title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SignUpForm(),
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: l10n.signup_terms_prefix,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                    children: [
                      TextSpan(
                        text: l10n.signup_terms_terms,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: l10n.signup_terms_and, style: const TextStyle(color: Colors.white70)),
                      TextSpan(
                        text: l10n.signup_terms_privacy,
                        style: const TextStyle(
                          color: Colors.white,
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
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: PrimaryElevantedButtonCustom(onPressed: () {}, text: l10n.signup_button, isLoading: false),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.signup_already_registered, style: const TextStyle(color: Colors.white70)),
              TextButton(
                onPressed: () => GeneralNavigation.goToLogin(context),
                child: Text(
                  l10n.signup_signin,
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
