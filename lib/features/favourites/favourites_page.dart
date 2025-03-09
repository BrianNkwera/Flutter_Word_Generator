import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/app_states/theme_state.dart';
import '../../../app/app_states/app_state.dart';

// ignore: must_be_immutable
class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeState = context.watch<ThemeState>();
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Container(
          color: themeState.currentTheme.colorScheme.primaryContainer,
          child: const Center(child: Text('No Favourites')));
    }

    return Container(
      color: themeState.currentTheme.colorScheme.primaryContainer,
      child: ListView(
        children: [
          for (var pair in appState.favorites)
            ListTile(leading: const Icon(Icons.favorite), title: Text('$pair'))
        ],
      ),
    );
  }
}
