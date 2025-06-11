import 'package:fitness_gym_app/components/input_field_custom.dart';
import 'package:fitness_gym_app/components/primary_elevanted_button_custom.dart';
import 'package:fitness_gym_app/core/features/button_styles.dart';
import 'package:fitness_gym_app/core/features/text_styles.dart';
import 'package:fitness_gym_app/navigation/general_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Glad to see you again!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          InputFieldCustom(icon: Icons.person, hint: "Username", obscureText: false, suffixIcon: Icons.check_circle),
          const SizedBox(height: 16),
          InputFieldCustom(icon: Icons.lock, hint: "Password", obscureText: true, suffixIcon: Icons.visibility_off),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?", style: TextStyle(color: Colors.white70)),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: PrimaryElevantedButtonCustom(
              onPressed: () => GeneralNavigation.goToHome(context),
              text: "Login Now",
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
                Text("Continue with Google", style: TextStyles.buttonTextDark),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account ", style: TextStyle(color: Colors.white70)),
              TextButton(
                onPressed: () => GeneralNavigation.goToSignUp(context),
                child: const Text("Sign Up", style: TextStyle(color: Color(0xFFB388FF), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
