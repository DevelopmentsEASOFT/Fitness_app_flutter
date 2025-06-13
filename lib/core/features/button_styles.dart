import 'package:flutter/material.dart';

import 'apps_colors.dart';

class ButtonStyles {
  static final primaryButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppsColors.primaryColor),
    foregroundColor: WidgetStateProperty.all(AppsColors.whiteColor),
    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    ),
  );
  static final secondaryButton = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppsColors.whiteColor),
    foregroundColor: WidgetStateProperty.all(AppsColors.blackColor),
    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    ),
  );
}
