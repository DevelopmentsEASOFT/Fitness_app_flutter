import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../commons/widgets/input_field_custom.dart';
import '../../../../../../commons/widgets/primary_elevated_button_custom.dart';
import '../../../../../../core/features/app_sizes.dart';
import '../../../../../../core/features/apps_colors.dart';
import '../../../../data/providers/auth_provider.dart';
import '../../../../../../navigation/general_navigation.dart';
import 'terms.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp(AppLocalizations l10n) async {
    if (!_formKey.currentState!.validate()) return;
    await ref
        .read(signUpViewModelProvider.notifier)
        .signUp(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          password: _passwordController.text,
        );
    final state = ref.read(signUpViewModelProvider);
    if (!mounted) return;
    if (state.success == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.signup_greeting(_nameController.text)),
          backgroundColor: AppsColors.successColor,
          duration: Duration(seconds: 1),
        ),
      );
      GeneralNavigation.goToHome(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.signup_error),
          backgroundColor: AppsColors.errorlightColor,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(signUpViewModelProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppSizes.gapH32,
          InputFieldCustom(
            controller: _nameController,
            icon: Icons.person,
            hint: l10n.signup_name_hint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.signup_name_required;
              }
              return null;
            },
          ),
          AppSizes.gapH16,
          InputFieldCustom(
            controller: _emailController,
            icon: Icons.email,
            hint: l10n.signup_email_hint,
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
          AppSizes.gapH16,
          InputFieldCustom(
            controller: _phoneController,
            icon: Icons.phone,
            hint: l10n.signup_phone_hint,
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
          AppSizes.gapH16,
          InputFieldCustom(
            controller: _passwordController,
            icon: Icons.lock,
            hint: l10n.signup_password_hint,
            obscureText: true,
            suffixIcon: Icons.visibility_off,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.signup_password_required;
              }
              if (value.length < 6) {
                return l10n.signup_password_min_length;
              }
              return null;
            },
          ),
          AppSizes.gapH16,
          Terms(),
          AppSizes.gapH24,
          SizedBox(
            width: double.infinity,
            height: 54,
            child: PrimaryElevatedButtonCustom(
              onPressed: state.isLoading ? () {} : () => _signUp(l10n),
              text: l10n.signup_button,
              isLoading: state.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
