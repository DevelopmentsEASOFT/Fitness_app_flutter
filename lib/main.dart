import 'package:fitness_gym_app/navigation/general_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static final _navigation = GeneralNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _navigation.routerConfig);
  }
}
