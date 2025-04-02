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
      padding: const EdgeInsets.all(15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: appState.favorites.length,
        itemBuilder: (context, index) {
          final pair = appState.favorites[index];
          return Card(
            elevation: 4,
            color: themeState.currentTheme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.favorite, color: Colors.red),
                  const SizedBox(width: 5),
                  Text('$pair',
                      style: TextStyle(
                        color: themeState
                            .currentTheme.colorScheme.primaryContainer,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
