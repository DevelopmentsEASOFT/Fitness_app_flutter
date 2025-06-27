class ApiEndpoints {
  const ApiEndpoints._();

  // Workouts
  static const String workouts = '/workouts.json';
  static String workoutDetails(int id) => '/workout_details/$id.json';
  static String workout(int id) => '/workouts/$id.json';

  static String membershipDetails(String userId) =>
      '/1/membership_details.json'; //TODO: reemplazar en su momento 1 por el userId correcto una vez que se implemente la autenticación
  static String paymentHistory(String userId) =>
      '/1/payment_history.json'; //TODO: reemplazar en su momento 1 por el userId correcto una vez que se implemente la autenticación

  // Auth
  static const String login = '/login';
  static const String signup = '/signup';
}
