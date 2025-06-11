import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/models/workout.dart';
import '../features/profile/edit_profile/edit_profile_screen.dart';
import '../features/home/home_screen.dart';
import '../features/auth/login/login_screen.dart';
import '../features/auth/sing_up/sign_up_screen.dart';
import '../features/auth/login/type_login_screen.dart';
import '../features/auth/welcome_screen.dart';
import '../features/profile/user_profile_screen.dart';
import '../features/workouts/workout_details_screen.dart';

class GeneralNavigation {
  static final _splashScreens = '/'; // '/splash';
  static final _typeLoginRouteName = 'typeLogin';
  static final _signUpRouteName = 'signup';
  static final _signInScreenName = 'signIn';
  static final _homeRouteName = 'home';
  static final _workoutDetailRouteName = 'workoutDetail';
  static final _userProfileRouteName = 'userProfile';
  static final _editProfileRouteName = 'editProfile';

  /// The route configuration.
  static final GoRouter routerConfig = GoRouter(
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
          GoRoute(
            path: _workoutDetailRouteName,
            name: _workoutDetailRouteName,
            builder: (BuildContext context, GoRouterState state) {
              final workout = state.extra as Workout?;
              if (workout == null) {
                return const HomeScreen(); // or handle error
              }
              return WorkoutDetailsScreen(workout: workout);
            },
          ),
          GoRoute(
            path: _userProfileRouteName,
            name: _userProfileRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const UserProfileScreen();
            },
          ),
          GoRoute(
            path: _editProfileRouteName,
            name: _editProfileRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const EditProfileScreen();
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

  static void goToWorkoutDetails(BuildContext context, Workout workout) {
    context.pushNamed(_workoutDetailRouteName, extra: workout);
  }

  static void goToUserProfile(BuildContext context) {
    context.pushNamed(_userProfileRouteName);
  }

  static void goToEditProfile(BuildContext context) {
    context.pushNamed(_editProfileRouteName);
  }
}
