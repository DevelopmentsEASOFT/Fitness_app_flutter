import 'package:fitness_gym_app/components/input_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/features/button_styles.dart';

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
      appBar: AppBar(
        title: Text(l10n.profile_edit),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 20),
          InputFieldCustom(icon: Icons.person, hint: l10n.profile_name_hint),
          SizedBox(height: 20),
          InputFieldCustom(icon: Icons.email, hint: l10n.profile_email_hint),
          SizedBox(height: 20),
          InputFieldCustom(icon: Icons.lock, hint: l10n.profile_password_hint, obscureText: true),
          SizedBox(height: 20),
          InputFieldCustom(icon: Icons.phone, hint: l10n.profile_phone_hint),
          SizedBox(height: 20),
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
    );
  }
}
