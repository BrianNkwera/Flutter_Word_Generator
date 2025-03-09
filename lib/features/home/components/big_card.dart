import 'package:first_flutter_app/app/app_states/app_state.dart';
import 'package:first_flutter_app/app/app_states/theme_state.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.themeState,
    required this.appState,
  });

  final ThemeState themeState;
  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: themeState.currentTheme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Text(
          appState.current.asLowerCase,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: themeState.currentTheme.colorScheme.primaryContainer),
        ),
      ),
    );
  }
}
