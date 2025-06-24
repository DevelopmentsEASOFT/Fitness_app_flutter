import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/ui/login/screens/auth_method_selection.dart';
import '../../features/auth/ui/login/screens/login_screen.dart';
import '../../features/auth/ui/sing_up/screens/sign_up_screen.dart';
import '../../features/auth/ui/welcome_view.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/membership/ui/screens/member_ship_history_screen.dart';
import '../../features/membership/ui/screens/member_ship_screen.dart';
import '../../features/profile/ui/screens/edit_profile/edit_profile_screen.dart';
import '../../features/profile/ui/screens/user_profile_screen.dart';
import '../../features/workouts/data/models/workout.dart';
import '../../features/workouts/data/models/workout_exercise.dart';
import '../../features/workouts/ui/screens/workout_details_screen.dart';
import '../../features/workouts/ui/screens/workout_session_screen.dart';
import '../../features/workouts/ui/screens/workout_summary_screen.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

final List<GoRoute> appRoutes = [
  GoRoute(
    path: AppRoutes.splashScreens,
    name: AppRoutes.splashScreens,
    builder: (BuildContext context, GoRouterState state) {
      return const WelcomeView();
    },
  ),
  GoRoute(
    path: AppRoutes.authMethodSelection,
    name: AppRoutes.authMethodSelection,
    builder: (BuildContext context, GoRouterState state) {
      return const AuthMethodSelection();
    },
  ),
  GoRoute(
    path: AppRoutes.signUp,
    name: AppRoutes.signUp,
    builder: (BuildContext context, GoRouterState state) {
      return const SignUpScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.signIn,
    name: AppRoutes.signIn,
    builder: (BuildContext context, GoRouterState state) {
      return const LoginScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.home,
    name: AppRoutes.home,
    builder: (BuildContext context, GoRouterState state) {
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.workoutDetail,
    name: AppRoutes.workoutDetail,
    builder: (BuildContext context, GoRouterState state) {
      return WorkoutDetailsScreen(workout: state.extra as Workout);
    },
  ),
  GoRoute(
    path: AppRoutes.workoutStart,
    name: AppRoutes.workoutStart,
    builder: (BuildContext context, GoRouterState state) {
      return const WorkoutSessionScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.workoutEndSummary,
    name: AppRoutes.workoutEndSummary,
    builder: (BuildContext context, GoRouterState state) {
      final List<WorkoutExercise> exercisesWorkoutCompleted = state.extra as List<WorkoutExercise>;
      return WorkoutSummaryScreen(
        calories: 0,
        bpm: 0,
        points: 0,
        exercisesWorkoutCompleted: exercisesWorkoutCompleted as List<WorkoutExercise>?,
      );
    },
  ),
  GoRoute(
    path: AppRoutes.userProfile,
    name: AppRoutes.userProfile,
    builder: (BuildContext context, GoRouterState state) {
      return const UserProfileScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.editProfile,
    name: AppRoutes.editProfile,
    builder: (BuildContext context, GoRouterState state) {
      return const EditProfileScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.membershipProfile,
    name: AppRoutes.membershipProfile,
    builder: (BuildContext context, GoRouterState state) {
      return const MembershipScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.historyMembership,
    name: AppRoutes.historyMembership,
    builder: (BuildContext context, GoRouterState state) {
      return const MembershipHistoryScreen();
    },
  ),
];

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(initialLocation: AppRoutes.splashScreens, routes: appRoutes);
}
