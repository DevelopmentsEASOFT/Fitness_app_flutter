import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../commons/widgets/app_bar_custom.dart';
import '../../../core/features/app_sizes.dart';
import '../../../core/features/apps_colors.dart';
import '../../../core/features/button_styles.dart';
import '../../../core/features/spacing_tokens.dart';
import '../../../commons/widgets/input_field_custom.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBarCustom(title: Text(l10n.profile_edit)),
      backgroundColor: AppsColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(SpacingTokens.medium),
        child: Column(
          children: [
            AppSizes.gapH20,
            InputFieldCustom(icon: Icons.person, hint: l10n.profile_name_hint),
            AppSizes.gapH20,
            InputFieldCustom(icon: Icons.email, hint: l10n.profile_email_hint),
            AppSizes.gapH20,
            InputFieldCustom(icon: Icons.lock, hint: l10n.profile_password_hint, obscureText: true),
            AppSizes.gapH20,
            InputFieldCustom(icon: Icons.phone, hint: l10n.profile_phone_hint),
            AppSizes.gapH20,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyles.primaryButton,
                    onPressed: () {
                      // Handle save action
                    },
                    child: Text(l10n.profile_save_changes),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
