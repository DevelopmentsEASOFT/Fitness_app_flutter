<<<<<<<< HEAD:lib/features/auth/login/type_login_screen.dart
========
import 'package:fitness_gym_app/core/features/button_styles.dart';
import 'package:fitness_gym_app/core/features/text_styles.dart';
>>>>>>>> bee0cf8132143219c4235634447c2b6d4e5ca172:lib/screens/login/type_login_screen.dart
import 'package:fitness_gym_app/navigation/general_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
<<<<<<<< HEAD:lib/features/auth/login/type_login_screen.dart

import '../../../core/features/app_sizes.dart';
import '../../../core/features/apps_colors.dart';
import '../../../core/features/button_styles.dart';
import '../../../core/features/text_styles.dart';
========
>>>>>>>> bee0cf8132143219c4235634447c2b6d4e5ca172:lib/screens/login/type_login_screen.dart

class TypeLoginScreens extends StatelessWidget {
  const TypeLoginScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              "assets/images/workout_gym.jpg", // Cambia la ruta si usas otra imagen
              fit: BoxFit.cover,
            ),
          ),
          // Degradado oscuro
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87, Colors.black],
                  stops: [0.0, 0.6, 1.0],
                ),
              ),
            ),
          ),
          // Contenido principal
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
                    child: Column(
                      children: [
                        Text(l10n.type_login_title, style: TextStyles.heading1White),
<<<<<<<< HEAD:lib/features/auth/login/type_login_screen.dart
                        AppSizes.gapH20,
========
                        const SizedBox(height: 20),
>>>>>>>> bee0cf8132143219c4235634447c2b6d4e5ca172:lib/screens/login/type_login_screen.dart
                        Text(l10n.type_login_subtitle, style: TextStyles.bodyText),
                      ],
                    ),
                  ),
                  AppSizes.gapH50,
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.01,
                            horizontal: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: ElevatedButton(
                            onPressed: () => GeneralNavigation.goToSignUp(context),
                            style: ButtonStyles.primaryButton,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/email_icon.svg', height: 24, width: 24),
<<<<<<<< HEAD:lib/features/auth/login/type_login_screen.dart
                                AppSizes.gapH12,
========
                                const SizedBox(width: 12),
>>>>>>>> bee0cf8132143219c4235634447c2b6d4e5ca172:lib/screens/login/type_login_screen.dart
                                Text(l10n.type_login_email, style: TextStyles.buttonText),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.01,
                            horizontal: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyles.secondaryButton,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/google_icon.svg', height: 24, width: 24),
<<<<<<<< HEAD:lib/features/auth/login/type_login_screen.dart
                                AppSizes.gapH12,
========
                                const SizedBox(width: 12),
>>>>>>>> bee0cf8132143219c4235634447c2b6d4e5ca172:lib/screens/login/type_login_screen.dart
                                Text(l10n.type_login_google, style: TextStyles.buttonTextDark),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSizes.gapH16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(l10n.type_login_already_registered, style: TextStyles.bodyText),
                      TextButton(
                        onPressed: () => GeneralNavigation.goToLogin(context),
                        child: Text(
                          l10n.type_login_signin,
<<<<<<<< HEAD:lib/features/auth/login/type_login_screen.dart
                          style: const TextStyle(color: AppsColors.primaryColor, fontWeight: FontWeight.bold),
========
                          style: const TextStyle(color: Color(0xFFB388FF), fontWeight: FontWeight.bold),
>>>>>>>> bee0cf8132143219c4235634447c2b6d4e5ca172:lib/screens/login/type_login_screen.dart
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
