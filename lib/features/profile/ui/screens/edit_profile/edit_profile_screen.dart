import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../commons/widgets/base_app_bar.dart';
import '../../../../../commons/widgets/input_field_custom.dart';
import '../../../../../commons/widgets/primary_elevated_button_custom.dart';
import '../../../../../core/features/apps_colors.dart';
import '../../../../../core/features/box_space.dart';
import '../../../../../core/features/spacing_tokens.dart';
import '../../../../../core/features/text_styles.dart';
import '../../../data/providers/profile_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<bool?> _updateProfile() async {
    return await ref
        .read(profileViewModelProvider.notifier)
        .updateProfile(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(profileViewModelProvider);

    return Scaffold(
      appBar: BaseAppBar(
        automaticallyImplyLeading: true,
        title: Text(localizations.profile_edit, style: TextStyles.headerTextWhite),
      ),
      backgroundColor: AppsColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(SpacingTokens.medium),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              BoxSpace.gapH20,
              InputFieldCustom(
                controller: _nameController,
                icon: Icons.person,
                hint: localizations.profile_name_hint,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.signup_name_required;
                  }
                  return null;
                },
              ),
              BoxSpace.gapH20,
              InputFieldCustom(
                controller: _emailController,
                icon: Icons.email,
                hint: localizations.profile_email_hint,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.signup_email_required;
                  }
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegex.hasMatch(value)) {
                    return localizations.signup_email_invalid;
                  }
                  return null;
                },
              ),
              BoxSpace.gapH20,
              InputFieldCustom(
                controller: _passwordController,
                icon: Icons.lock,
                hint: localizations.profile_password_hint,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.signup_password_required;
                  }
                  return null;
                },
              ),
              BoxSpace.gapH20,
              InputFieldCustom(
                controller: _phoneController,
                icon: Icons.phone,
                hint: localizations.profile_phone_hint,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations.signup_phone_required;
                  }
                  final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
                  if (!phoneRegex.hasMatch(value)) {
                    return localizations.signup_phone_invalid;
                  }
                  return null;
                },
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: PrimaryElevatedButtonCustom(
                      onPressed:
                          state.isLoading
                              ? () {}
                              : () {
                                if (!_formKey.currentState!.validate()) return;
                                _updateProfile().then((success) {
                                  if (success == true) {
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(SnackBar(content: Text(localizations.profile_save_changes)));
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(SnackBar(content: Text('Error updating profile')));
                                  }
                                });
                              },
                      text: localizations.profile_save_changes,
                      isLoading: state.isLoading,
                    ),
                  ),
                ],
              ),
              BoxSpace.gapH16,
            ],
          ),
        ),
      ),
    );
  }
}
