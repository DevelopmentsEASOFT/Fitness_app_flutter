import 'package:fitness_gym_app/components/input_field_custom.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        InputFieldCustom(icon: Icons.person, hint: "Your name"),
        const SizedBox(height: 16),
        InputFieldCustom(icon: Icons.email, hint: "Email address"),
        const SizedBox(height: 16),
        InputFieldCustom(icon: Icons.phone, hint: "Phone number"),
        const SizedBox(height: 16),
        InputFieldCustom(icon: Icons.lock, hint: "Password", obscureText: true, suffixIcon: Icons.visibility_off),
        const SizedBox(height: 16),
      ],
    );
  }
}
