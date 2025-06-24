import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../commons/widgets/input_field_custom.dart';
import '../../../../../commons/widgets/primary_elevated_button_custom.dart';
import '../../../../../config/router/app_routes.dart';
import '../../../../../core/features/apps_colors.dart';
import '../../../data/providers/auth_provider.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<bool> _isLoginValid() async {
    return await ref
        .read(loginViewModelProvider.notifier)
        .islogin(username: _usernameController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(loginViewModelProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputFieldCustom(
            controller: _usernameController,
            icon: Icons.person,
            hint: localizations.login_username_hint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.login_username_required;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          InputFieldCustom(
            controller: _passwordController,
            icon: Icons.lock,
            hint: localizations.login_password_hint,
            obscureText: true,
            suffixIcon: Icons.visibility_off,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.login_password_required;
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: PrimaryElevatedButtonCustom(
              onPressed:
                  state.isLoading
                      ? () {}
                      : () {
                        if (!_formKey.currentState!.validate()) return;

                        _isLoginValid().then((success) {
                          if (success) {
                            FocusScope.of(context).unfocus();
                            context.go(AppRoutes.home);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(localizations.login_error),
                                backgroundColor: AppsColors.errorlightColor,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        });
                      },
              text: localizations.login_button,
              isLoading: state.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
