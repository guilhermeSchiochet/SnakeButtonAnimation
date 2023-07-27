import 'package:flutter/material.dart';
import 'package:snake_button_animation/presentation/screens/home_screen.dart';
import 'package:snake_button_animation/presentation/utils/theme_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.theme,
      home: const HomeScreen(),
    );
  }
}