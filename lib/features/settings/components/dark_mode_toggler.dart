import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/app_states/theme_state.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SwitchListTile(
        title: const Text('Dark Mode'),
        subtitle: const Text('Switch between light and dark themes'),
        value: context.watch<ThemeState>().isDarkTheme,
        onChanged: (_) => context.read<ThemeState>().toggleTheme(),
      ),
    );
  }
} 