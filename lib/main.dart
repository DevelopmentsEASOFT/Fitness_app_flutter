import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
<<<<<<< HEAD

import '../navigation/general_navigation.dart';
=======
>>>>>>> bee0cf8132143219c4235634447c2b6d4e5ca172

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      routerConfig: GeneralNavigation.routerConfig,
=======
      routerConfig: _navigation.routerConfig,
>>>>>>> bee0cf8132143219c4235634447c2b6d4e5ca172
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
