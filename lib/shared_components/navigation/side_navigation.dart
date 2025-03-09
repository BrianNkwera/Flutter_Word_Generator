import 'package:first_flutter_app/shared_components/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class AppNavigationRail extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppNavigationRail({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: currentIndex,
      extended: true,
      onDestinationSelected: onDestinationSelected,
      destinations: AppNavigationConfig.items
          .map((item) => NavigationRailDestination(
                icon: Icon(item.icon),
                label: Text(item.label),
              ))
          .toList(),
    );
  }
}
