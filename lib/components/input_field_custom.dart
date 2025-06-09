import 'package:flutter/material.dart';

class InputFieldCustom extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscureText;
  final IconData? suffixIcon;

  const InputFieldCustom({
    super.key,
    required this.icon,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        prefixIcon: Icon(icon, color: Colors.white54),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.white54) : null,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
      ),
    );
  }
}
