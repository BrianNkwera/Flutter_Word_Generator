import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import custom state management classes
import 'app_states/app_state.dart';
import 'app_states/theme_state.dart';
// Import the main layout widget
import 'main_layout.dart';

// MyApp is the root widget of the application
// StatelessWidget is used because this widget doesn't need to maintain any state itself
class MyApp extends StatelessWidget {
  // Constructor with optional key parameter
  // 'super.key' passes the key to the parent StatelessWidget class
  const MyApp({super.key});

  @override
  // Build method that creates the widget tree
  Widget build(BuildContext context) {
    // MultiProvider allows multiple state providers to be available to child widgets
    //https://docs.flutter.dev/data-and-backend/state-mgmt/simple
    return MultiProvider(
      // List of providers that will be available throughout the app
      providers: [
        // ChangeNotifierProvider for MyAppState - handles general app state
        ChangeNotifierProvider(create: (context) => MyAppState()),
        // ChangeNotifierProvider for ThemeState - handles theme-related state
        ChangeNotifierProvider(create: (context) => ThemeState()),
      ],
      // Consumer widget listens to changes in ThemeState
      child: Consumer<ThemeState>(
        // Builder function that rebuilds when ThemeState changes
        // context: build context
        // themeState: instance of ThemeState
        // _: child widget (not used here, hence underscore)
        builder: (context, themeState, _) {
          // MaterialApp is the core widget that provides navigation and theming
          return MaterialApp(
            // Application title
            title: 'First Flutter App',
            // Current theme obtained from ThemeState
            theme: themeState.currentTheme,
            // Main layout widget as the home screen
            home: const MainLayout(),
          );
        },
      ),
    );
  }
}