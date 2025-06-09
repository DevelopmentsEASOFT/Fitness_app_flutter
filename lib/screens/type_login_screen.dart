import 'package:fitness_gym_app/core/button_styles.dart';
import 'package:fitness_gym_app/core/text_styles.dart';
import 'package:fitness_gym_app/navigation/general_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TypeLoginScreens extends StatelessWidget {
  const TypeLoginScreens({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(bottom: 70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Column(
                      children: [
                        Text("Track your Activity", style: TextStyles.heading1White),
                        const SizedBox(height: 20),
                        Text("Track your Fitness and workout", style: TextStyles.bodyText),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => GeneralNavigation.goToSignUp(context),
                            style: ButtonStyles.primaryButton,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/email_icon.svg', height: 24, width: 24),
                                const SizedBox(width: 12),
                                Text("Continue with Email", style: TextStyles.buttonText),
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
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyles.secondaryButton,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/google_icon.svg', height: 24, width: 24),
                                const SizedBox(width: 12),
                                Text("Continue with Google", style: TextStyles.buttonTextDark),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already registered? ", style: TextStyles.bodyText),
                      TextButton(
                        onPressed: () => GeneralNavigation.goToLogin(context),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(color: Color(0xFFB388FF), fontWeight: FontWeight.bold),
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
