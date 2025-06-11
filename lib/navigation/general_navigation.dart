import 'package:fitness_gym_app/screens/home/home_screen.dart';
import 'package:fitness_gym_app/screens/login/login_screen.dart';
import 'package:fitness_gym_app/screens/sing_up/sign_up_screen.dart';
import 'package:fitness_gym_app/screens/login/type_login_screen.dart';
import 'package:fitness_gym_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GeneralNavigation {
  static final _splashScreens = '/'; // '/splash';
  static final _typeLoginRouteName = 'typeLogin';
  static final _signUpRouteName = 'signup';
  static final _signInScreenName = 'signIn';
  static final _homeRouteName = 'home';

  /// The route configuration.
  final GoRouter routerConfig = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: _splashScreens,
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: _typeLoginRouteName,
            name: _typeLoginRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const TypeLoginScreens();
            },
          ),
          GoRoute(
            path: _signUpRouteName,
            name: _signUpRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpScreen();
            },
          ),
          GoRoute(
            path: _signInScreenName,
            name: _signInScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: _homeRouteName,
            name: _homeRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
        ],
      ),
    ],
  );

  static void pushTypelogin(BuildContext context) {
    context.pushNamed(_typeLoginRouteName);
  }

  static void goToSignUp(BuildContext context) {
    context.pushNamed(_signUpRouteName);
  }

  static void goToLogin(BuildContext context) {
    context.pushNamed(_signInScreenName);
  }

  static void goToHome(BuildContext context) {
    context.pushNamed(_homeRouteName);
  }
}
