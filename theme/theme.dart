import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 245, 245, 245), // softer light surface
    primary: Color.fromARGB(255, 230, 97, 0),   // deep orange
    secondary: Color.fromARGB(255, 255, 255, 255),
    tertiary: Color.fromARGB(255, 0, 0, 0),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color.fromARGB(255, 20, 20, 20),
    primary: Color.fromARGB(255, 255, 140, 0),   // bright orange for dark mode
    secondary: Color.fromARGB(255, 40, 40, 40),
    tertiary: Color.fromARGB(255, 255, 255, 255),
  ),
);
