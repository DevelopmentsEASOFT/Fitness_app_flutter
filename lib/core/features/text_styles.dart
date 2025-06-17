import 'package:flutter/material.dart';

import 'apps_colors.dart';

class TextStyles {
  static final TextStyle heading1 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppsColors.blackColor);
  static final TextStyle heading1White = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppsColors.whiteColor,
  );
  static final TextStyle heading2 = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppsColors.blackColor);
  static final TextStyle heading2White = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppsColors.whiteColor,
  );
  static final TextStyle heading3White = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppsColors.whiteColor,
  );

  static final TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppsColors.blackColor,
  );
  static final TextStyle bodyTextWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppsColors.whiteColor,
  );
  static final TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppsColors.whiteColor,
  );
  static final TextStyle buttonTextDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppsColors.blackColor,
  );
  static final TextStyle caption = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppsColors.blackColor);
  static final TextStyle errorText = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppsColors.errorColor);
  static final TextStyle linkText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppsColors.primaryColor,
    decoration: TextDecoration.underline,
  );
  static final TextStyle smallText = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppsColors.blackColor);
  static final TextStyle largeText = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppsColors.blackColor);
  static final TextStyle subtitle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppsColors.blackColor);
}
