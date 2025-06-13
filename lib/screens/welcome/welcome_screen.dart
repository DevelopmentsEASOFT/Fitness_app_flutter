<<<<<<<< HEAD:lib/features/auth/welcome_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/features/app_sizes.dart';
import '../../core/features/button_styles.dart';
import '../../core/features/text_styles.dart';
import '../../navigation/general_navigation.dart';
========
import 'package:fitness_gym_app/navigation/general_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Importa l10n

import '../../core/features/button_styles.dart';
import '../../core/features/text_styles.dart';
>>>>>>>> bee0cf8132143219c4235634447c2b6d4e5ca172:lib/screens/welcome/welcome_screen.dart

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/start_gym.png", fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87, Colors.black], //TODO: migrara a AppsColors
                  stops: [0.0, 0.6, 1.0],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(l10n.title_welcome, style: TextStyles.heading1White),
<<<<<<<< HEAD:lib/features/auth/welcome_screen.dart
                  AppSizes.gapH5,
                  Text(l10n.txt_welcome, style: TextStyles.bodyTextWhite, textAlign: TextAlign.center),
                  AppSizes.gapH20,
========
                  SizedBox(height: 5),
                  Text(l10n.txt_welcome, style: TextStyles.bodyText, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
>>>>>>>> bee0cf8132143219c4235634447c2b6d4e5ca172:lib/screens/welcome/welcome_screen.dart
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.01,
                            horizontal: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: ElevatedButton(
                            onPressed: () => GeneralNavigation.pushTypelogin(context),
                            style: ButtonStyles.primaryButton,
                            child: Text(l10n.btn_start, style: TextStyles.buttonText),
                          ),
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
