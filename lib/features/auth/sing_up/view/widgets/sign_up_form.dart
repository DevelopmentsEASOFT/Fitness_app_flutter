import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../commons/widgets/input_field_custom.dart';
import '../../../../../commons/widgets/primary_elevated_button_custom.dart';
import '../../../../../core/features/app_sizes.dart';
import '../../../../../navigation/general_navigation.dart';
import '../../view_model/sign_up_view_model.dart';
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

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;
    await ref
        .read(signUpFormViewModelProvider.notifier)
        .signUp(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          password: _passwordController.text,
        );
    final state = ref.read(signUpFormViewModelProvider);
    if (!mounted) return;
    if (state.success == true) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registro exitoso'))); //TODO: Localize this message
      GeneralNavigation.goToHome(context);
    } else if (state.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!)));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Error al registrarse'))); //TODO: Localize this message
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(signUpFormViewModelProvider);

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
              onPressed: state.isLoading ? () {} : () => _signUp(),
              text: l10n.signup_button,
              isLoading: state.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
