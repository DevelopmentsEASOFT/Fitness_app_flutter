import 'package:fitness_gym_app/components/primary_elevanted_button_custom.dart';
import 'package:fitness_gym_app/navigation/general_navigation.dart';
import 'package:fitness_gym_app/screens/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          const Text(
            "Sign up and\nstarting workout",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SignInForm(),
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: "By signing up you agree to our ",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    children: [
                      TextSpan(
                        text: "Term of use",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: " and ", style: TextStyle(color: Colors.white70)),
                      TextSpan(
                        text: "privacy notice",
                        style: TextStyle(
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
            child: PrimaryElevantedButtonCustom(onPressed: () {}, text: "Sign Up", isLoading: false),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already registered? ", style: TextStyle(color: Colors.white70)),
              TextButton(
                onPressed: () => GeneralNavigation.goToLogin(context),
                child: const Text("Sign In", style: TextStyle(color: Color(0xFFB388FF), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
