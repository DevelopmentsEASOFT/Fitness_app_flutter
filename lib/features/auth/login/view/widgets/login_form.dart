import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../commons/widgets/input_field_custom.dart';
import '../../../../../commons/widgets/primary_elevated_button_custom.dart';
import '../../../../../data/repository/providers/auth_provider.dart';
import '../../../../../navigation/general_navigation.dart';
import '../../view_model/login_view_model.dart';

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

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    await ref
        .read(loginViewModelProvider.notifier)
        .login(username: _usernameController.text, password: _passwordController.text);
    final state = ref.read(loginViewModelProvider);
    if (!mounted) return;
    if (state.success == true) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login exitoso'))); //TODO: Localize this message
      GeneralNavigation.goToHome(context);
    } else if (state.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!)));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Error al iniciar sesión'))); //TODO: Localize this message
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(loginViewModelProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputFieldCustom(
            controller: _usernameController,
            icon: Icons.person,
            hint: l10n.login_username_hint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return l10n.login_username_required;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: PrimaryElevatedButtonCustom(
              onPressed: state.isLoading ? () {} : () => _login(),
              text: l10n.login_button,
              isLoading: state.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
