import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_states/app_state.dart';
import '../../../app/app_states/theme_state.dart';
import './components/big_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //listen for changes in state
    var appState = context.watch<MyAppState>();
    var themeState = context.watch<ThemeState>();

    return Container(
      color: themeState.currentTheme.colorScheme.primaryContainer,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('A random idea:'),
            const SizedBox(height: 10),
            BigCard(themeState: themeState, appState: appState),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: appState.toggleFavorite,
                  icon: Icon(appState.favorites.contains(appState.current)
                      ? Icons.favorite
                      : Icons.favorite_border),
                  label: const Text('Like'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: appState.getNext,
                  child: const Text('Generate'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}