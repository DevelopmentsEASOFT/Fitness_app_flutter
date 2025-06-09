import 'package:flutter/material.dart';

class ButtonStyles {
  static final primaryButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 114, 93, 238)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    ),
  );
  static final secondaryButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 253, 253, 252)),
    foregroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 34, 30, 30)),
    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    ),
  );
}
