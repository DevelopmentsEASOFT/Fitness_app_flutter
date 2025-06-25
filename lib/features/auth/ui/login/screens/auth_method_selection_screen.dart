import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/features/apps_colors.dart';
import '../../../../../core/features/box_space.dart';
import '../../../../../core/features/button_styles.dart';
import '../../../../../core/features/text_styles.dart';

class AuthMethodSelectionScreen extends ConsumerWidget {
  const AuthMethodSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/workout_gym.jpg", fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppsColors.gradientColor,
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
                        Text(localizations.type_login_title, style: TextStyles.heading1White),
                        BoxSpace.gapH20,

                        const SizedBox(height: 20),
                        Text(localizations.type_login_subtitle, style: TextStyles.bodyText),
                      ],
                    ),
                  ),
                  BoxSpace.gapH50,
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.01,
                            horizontal: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: ElevatedButton(
                            onPressed: () => context.goNamed(AppRoutes.signUp),
                            style: ButtonStyles.primaryButton,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/email_icon.svg', height: 24, width: 24),
                                BoxSpace.gapH12,
                                const SizedBox(width: 12),
                                Text(localizations.type_login_email, style: TextStyles.buttonText),
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
                                BoxSpace.gapH12,
                                const SizedBox(width: 12),
                                Text(localizations.type_login_google, style: TextStyles.buttonTextDark),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  BoxSpace.gapH16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(localizations.type_login_already_registered, style: TextStyles.bodyTextWhite),
                      TextButton(
                        onPressed: () => context.goNamed(AppRoutes.signIn),
                        child: Text(
                          localizations.type_login_signin,
                          style: const TextStyle(color: AppsColors.primaryColor, fontWeight: FontWeight.bold),
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
