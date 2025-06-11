import 'package:flutter/material.dart';

class TextStyles {
  static final TextStyle heading1 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF333333));
  static final TextStyle heading1White = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(217, 213, 213, 1),
  );
  static final TextStyle heading2 = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF555555));
  static final TextStyle bodyText = TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Color(0xFF777777));
  static final TextStyle bodyTextWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Color.fromRGBO(217, 213, 213, 1),
  );
  static final TextStyle buttonText = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);
  static final TextStyle buttonTextDark = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black);
  static final TextStyle caption = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF999999));
  static final TextStyle errorText = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red);
  static final TextStyle linkText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1E88E5),
    decoration: TextDecoration.underline,
  );
  static final TextStyle smallText = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFFB0BEC5));
  static final TextStyle largeText = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF212121));
  static final TextStyle subtitle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF616161));
}
