import 'package:fitness_gym_app/core/features/apps_colors.dart';
import 'package:flutter/material.dart';

class InputFieldCustom extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscureText;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const InputFieldCustom({
    super.key,
    required this.icon,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(color: AppsColors.whiteColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppsColors.fillColor,
        prefixIcon: Icon(icon, color: AppsColors.grayColor),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: AppsColors.grayColor) : null,
        hintText: hint,
        hintStyle: const TextStyle(color: AppsColors.grayColor),
        errorStyle: const TextStyle(color: AppsColors.errorColor, fontWeight: FontWeight.w600, fontSize: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
          horizontal: MediaQuery.of(context).size.height * 0.02,
        ),
      ),
    );
  }
}
