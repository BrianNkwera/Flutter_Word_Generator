import 'package:flutter/material.dart';

// ThemeState manages the app's theming logic
// ChangeNotifier allows widgets to be notified when theme changes
class ThemeState extends ChangeNotifier {
  // Private boolean to track dark/light theme
  // Prefixed with '_' to make it private to this file
  bool _isDarkTheme = false;

  // Private color variable to store the app's seed color
  // Defaults to blue if no color is selected
  Color _seedColor = Colors.blue;

  // Getter for dark theme status
  // Allows other parts of the app to read the current theme mode
  bool get isDarkTheme => _isDarkTheme;

  // Getter for current seed color
  Color get seedColor => _seedColor;

  // Generates the current theme based on dark mode and seed color
  // 'get' makes this a computed property that updates dynamically
  ThemeData get currentTheme => _isDarkTheme
      ? ThemeData.dark().copyWith(
          // For dark theme, use seed color with dark brightness
          colorScheme: ColorScheme.fromSeed(
            seedColor: _seedColor, 
            brightness: Brightness.dark
          ),
        )
      : ThemeData.light().copyWith(
          // For light theme, use seed color with light brightness
          colorScheme: ColorScheme.fromSeed(
            seedColor: _seedColor,
            brightness: Brightness.light
          ),
        );

  // Toggle between light and dark themes
  // Flips the boolean and notifies listeners of the change
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    // Tells all listening widgets to rebuild with new theme
    notifyListeners();
  }

  // Set a new seed color for the theme
  // Allows dynamic color changing
  void setSeedColor(Color color) {
    _seedColor = color;
    // Notify listeners so UI can update with new color
    notifyListeners();
  }
}