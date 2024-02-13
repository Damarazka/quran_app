import 'package:flutter/material.dart';
import 'package:quran_app/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      initialRoute: SplashScreen.routeName,
      routes: {SplashScreen.routeName: (context) => const SplashScreen()},
    );
  }
}
