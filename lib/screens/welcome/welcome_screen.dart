import 'package:fitness_gym_app/navigation/general_navigation.dart';
import 'package:flutter/material.dart';

import '../../core/features/button_styles.dart';
import '../../core/features/text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  colors: [Colors.transparent, Colors.black87, Colors.black],
                  stops: [0.0, 0.6, 1.0],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Track your Activity", style: TextStyles.heading1White),
                  Text("Track your Fitness and workout", style: TextStyles.bodyText),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => GeneralNavigation.pushTypelogin(context),
                            style: ButtonStyles.primaryButton,
                            child: Text("Get Started", style: TextStyles.buttonText),
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
