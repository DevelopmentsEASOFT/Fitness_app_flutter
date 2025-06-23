import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/features/app_sizes.dart';
import '../../../core/features/apps_colors.dart';
import '../../../core/features/button_styles.dart';
import '../../../core/features/text_styles.dart';
import '../../../navigation/general_navigation.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/start_gym.png", fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppsColors.gradientColor,
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
                  AppSizes.gapH5,
                  Text(l10n.txt_welcome, style: TextStyles.bodyTextWhite, textAlign: TextAlign.center),
                  AppSizes.gapH20,
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
