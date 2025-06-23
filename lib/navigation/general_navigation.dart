import 'package:fitness_gym_app/features/workouts/data/models/workout_exercise.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/workouts/data/models/workout.dart';
import '../features/membership/ui/view/member_ship_history_view.dart';
import '../features/membership/ui/view/member_ship_view.dart';
import '../features/profile/ui/view/edit_profile/edit_profile_view.dart';
import '../features/home/ui/home_view.dart';
import '../features/auth/ui/login/view/login_view.dart';
import '../features/auth/ui/sing_up/view/sign_up_view.dart';
import '../features/auth/ui/login/view/type_login_view.dart';
import '../features/auth/ui/welcome_view.dart';
import '../features/profile/ui/view/user_profile_view.dart';
import '../features/workouts/ui/view/workout_details_view.dart';
import '../features/workouts/ui/view/workout_session_view.dart';
import '../features/workouts/ui/view/workout_summary_view.dart';

class GeneralNavigation {
  static final _splashScreens = '/'; // '/splash';
  static final _typeLoginRouteName = 'typeLogin';
  static final _signUpRouteName = 'signup';
  static final _signInScreenName = 'signIn';
  static final _homeRouteName = 'home';
  static final _workoutDetailRouteName = 'workoutDetail';
  static final _workoutStartRouteName = 'workoutStart';
  static final _workoutEndSummaryRouteName = 'workoutEndSummary';
  static final _userProfileRouteName = 'userProfile';
  static final _editProfileRouteName = 'editProfile';
  static final _memberShipProfileRouteName = 'memberShipProfile';
  static final _historyMemberShipRouteName = 'historyMemberShipProfile';

  /// The route configuration.
  static final GoRouter routerConfig = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: _splashScreens,
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: _typeLoginRouteName,
            name: _typeLoginRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const TypeLoginView();
            },
          ),
          GoRoute(
            path: _signUpRouteName,
            name: _signUpRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpView();
            },
          ),
          GoRoute(
            path: _signInScreenName,
            name: _signInScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginView();
            },
          ),
          GoRoute(
            path: _homeRouteName,
            name: _homeRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
          ),
          GoRoute(
            path: _workoutDetailRouteName,
            name: _workoutDetailRouteName,
            builder: (BuildContext context, GoRouterState state) {
              final workout = state.extra as Workout?;
              if (workout == null) {
                return const HomeView(); // or handle error
              }
              return WorkoutDetailsView(workout: workout);
            },
          ),
          GoRoute(
            path: _workoutStartRouteName,
            name: _workoutStartRouteName,
            builder: (BuildContext context, GoRouterState state) {
              // final workout = state.extra as Workout?;
              return WorkoutSessionView();
            },
          ),
          GoRoute(
            path: _workoutEndSummaryRouteName,
            name: _workoutEndSummaryRouteName,
            builder: (BuildContext context, GoRouterState state) {
              // final workout = state.extra as Workout?;
              return WorkoutSummaryView(
                exercisesWorkoutCompleted: state.extra as List<WorkoutExercise>?,
                calories: 0,
                bpm: 0,
                points: 0,
              );
            },
          ),
          GoRoute(
            path: _userProfileRouteName,
            name: _userProfileRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const UserProfileView();
            },
          ),
          GoRoute(
            path: _editProfileRouteName,
            name: _editProfileRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const EditProfileView();
            },
          ),
          GoRoute(
            path: _memberShipProfileRouteName,
            name: _memberShipProfileRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const MemberShipView();
            },
          ),
          GoRoute(
            path: _historyMemberShipRouteName,
            name: _historyMemberShipRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return const MemberShipHistoryView();
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

  static void goToWorkoutSession(BuildContext context) {
    context.pushNamed(_workoutStartRouteName);
  }

  static void goToMemberShipProfile(BuildContext context) {
    context.pushNamed(_memberShipProfileRouteName);
  }

  static void goToHistoryMemberShip(BuildContext context) {
    context.pushNamed(_historyMemberShipRouteName);
  }

  static void goToWorkoutSessionSummary(
    BuildContext context, {
    required List<WorkoutExercise>? exercisesWorkoutCompleted,
  }) {
    context.pushReplacementNamed(_workoutEndSummaryRouteName, extra: exercisesWorkoutCompleted);
  }
}
