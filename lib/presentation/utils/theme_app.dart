import 'package:flutter/material.dart';

class ThemeApp {
  static const primaryColor = Color.fromARGB(255, 43, 43, 43);

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ThemeApp.primaryColor
  );
}