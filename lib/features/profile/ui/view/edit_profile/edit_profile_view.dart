import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../commons/widgets/app_bar_custom.dart';
import '../../../../../commons/widgets/input_field_custom.dart';
import '../../../../../commons/widgets/primary_elevated_button_custom.dart';
import '../../../../../core/features/app_sizes.dart';
import '../../../../../core/features/apps_colors.dart';
import '../../../../../core/features/spacing_tokens.dart';
import '../../../../../core/features/text_styles.dart';
import '../../../data/providers/profile_provider.dart';

class EditProfileView extends ConsumerStatefulWidget {
  const EditProfileView({super.key});

  @override
  ConsumerState<EditProfileView> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileView> {
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

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;
    await ref
        .read(profileViewModelProvider.notifier)
        .updateProfile(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          password: _passwordController.text,
        );
    final state = ref.read(profileViewModelProvider);
    if (!mounted) return;
    if (state.success == true) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.profile_save_changes)));
      Navigator.of(context).pop();
    } else if (state.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error updating profile')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(profileViewModelProvider);

    return Scaffold(
      appBar: AppBarCustom(
        automaticallyImplyLeading: true,
        title: Text(l10n.profile_edit, style: TextStyles.headerTextWhite),
      ),
      backgroundColor: AppsColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(SpacingTokens.medium),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppSizes.gapH20,
              InputFieldCustom(
                controller: _nameController,
                icon: Icons.person,
                hint: l10n.profile_name_hint,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.signup_name_required;
                  }
                  return null;
                },
              ),
              AppSizes.gapH20,
              InputFieldCustom(
                controller: _emailController,
                icon: Icons.email,
                hint: l10n.profile_email_hint,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.signup_email_required;
                  }
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegex.hasMatch(value)) {
                    return l10n.signup_email_invalid;
                  }
                  return null;
                },
              ),
              AppSizes.gapH20,
              InputFieldCustom(
                controller: _passwordController,
                icon: Icons.lock,
                hint: l10n.profile_password_hint,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.signup_password_required;
                  }
                  return null;
                },
              ),
              AppSizes.gapH20,
              InputFieldCustom(
                controller: _phoneController,
                icon: Icons.phone,
                hint: l10n.profile_phone_hint,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.signup_phone_required;
                  }
                  final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
                  if (!phoneRegex.hasMatch(value)) {
                    return l10n.signup_phone_invalid;
                  }
                  return null;
                },
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: PrimaryElevatedButtonCustom(
                      onPressed: state.isLoading ? () {} : () => _updateProfile(),
                      text: l10n.profile_save_changes,
                      isLoading: state.isLoading,
                    ),
                  ),
                ],
              ),
              AppSizes.gapH16,
            ],
          ),
        ),
      ),
    );
  }
}
