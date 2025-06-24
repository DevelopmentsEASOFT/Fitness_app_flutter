import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../commons/widgets/input_field_custom.dart';
import '../../../../../commons/widgets/primary_elevated_button_custom.dart';
import '../../../../../config/router/app_routes.dart';
import '../../../../../core/features/app_sizes.dart';
import '../../../../../core/features/apps_colors.dart';
import '../../../data/providers/auth_provider.dart';
import 'terms_and_privacy_label.dart';

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

  Future<bool> _isSignUpValid() async {
    return await ref
        .read(signUpViewModelProvider.notifier)
        .signUp(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(signUpViewModelProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppSizes.gapH32,
          InputFieldCustom(
            controller: _nameController,
            icon: Icons.person,
            hint: localizations.signup_name_hint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.signup_name_required;
              }
              return null;
            },
          ),
          AppSizes.gapH16,
          InputFieldCustom(
            controller: _emailController,
            icon: Icons.email,
            hint: localizations.signup_email_hint,
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
          AppSizes.gapH16,
          InputFieldCustom(
            controller: _phoneController,
            icon: Icons.phone,
            hint: localizations.signup_phone_hint,
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
          AppSizes.gapH16,
          InputFieldCustom(
            controller: _passwordController,
            icon: Icons.lock,
            hint: localizations.signup_password_hint,
            obscureText: true,
            suffixIcon: Icons.visibility_off,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.signup_password_required;
              }
              if (value.length < 6) {
                return localizations.signup_password_min_length;
              }
              return null;
            },
          ),
          AppSizes.gapH16,
          TermsAndPrivacyLabel(),
          AppSizes.gapH24,
          SizedBox(
            width: double.infinity,
            height: 54,
            child: PrimaryElevatedButtonCustom(
              onPressed:
                  state.isLoading
                      ? () {}
                      : () {
                        {
                          if (!_formKey.currentState!.validate()) return;
                          _isSignUpValid().then((success) {
                            if (success) {
                              FocusScope.of(context).unfocus();
                              context.go(AppRoutes.home);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(localizations.signup_error),
                                  backgroundColor: AppsColors.errorlightColor,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          });
                        }
                      },
              text: localizations.signup_button,
              isLoading: state.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
