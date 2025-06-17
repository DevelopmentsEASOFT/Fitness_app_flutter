import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../commons/widgets/input_field_custom.dart';
import '../../../../commons/widgets/primary_elevated_button_custom.dart';
import '../../../../core/features/app_sizes.dart';
import '../../../../core/features/apps_colors.dart';
import '../../../../data/repository/repository.dart';
import '../../../../navigation/general_navigation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() => _isLoading = true);
    final repo = Repository();
    final success = await repo.doLogin(_usernameController.text, _passwordController.text);
    if (!mounted) return;
    setState(() => _isLoading = false);
    if (success) {
      GeneralNavigation.goToHome(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Usuario o contraseña incorrectos')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputFieldCustom(
            controller: _usernameController,
            icon: Icons.person,
            hint: l10n.login_username_hint,
            obscureText: false,
            suffixIcon: Icons.check_circle,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.login_username_required;
              }
              return null;
            },
          ),
          AppSizes.gapH16,
          InputFieldCustom(
            controller: _passwordController,
            icon: Icons.lock,
            hint: l10n.login_password_hint,
            obscureText: true,
            suffixIcon: Icons.visibility_off,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.login_password_required;
              }
              return null;
            },
          ),
          AppSizes.gapH16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(l10n.login_forgot_password, style: const TextStyle(color: AppsColors.whiteColor)),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: PrimaryElevatedButtonCustom(onPressed: _login, text: l10n.login_button, isLoading: _isLoading),
          ),
        ],
      ),
    );
  }
}
