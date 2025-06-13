import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../commons/widgets/input_field_custom.dart';
import '../../../../core/features/app_sizes.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        AppSizes.gapH32,
        InputFieldCustom(icon: Icons.person, hint: l10n.signup_name_hint),
        AppSizes.gapH16,
        InputFieldCustom(icon: Icons.email, hint: l10n.signup_email_hint),
        AppSizes.gapH16,
        InputFieldCustom(icon: Icons.phone, hint: l10n.signup_phone_hint),
        AppSizes.gapH16,
        InputFieldCustom(
          icon: Icons.lock,
          hint: l10n.signup_password_hint,
          obscureText: true,
          suffixIcon: Icons.visibility_off,
        ),
        AppSizes.gapH16,
      ],
    );
  }
}
