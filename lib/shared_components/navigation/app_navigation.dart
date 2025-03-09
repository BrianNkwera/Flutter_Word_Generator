import 'package:flutter/material.dart';
import '../../features/home/home_page.dart';
import '../../features/favourites/favourites_page.dart';
import '../../features/settings/settings_page.dart';

//This File Defines My Routing

// Define a navigation item
class NavigationItem {
  final IconData icon;
  final String label;
  final Widget page;

  NavigationItem({
    required this.icon,
    required this.label,
    required this.page,
  });
}

// Navigation configuration
class AppNavigationConfig {
  static final List<NavigationItem> items = [
    NavigationItem(
      icon: Icons.home,
      label: 'Home',
      page: const HomePage(), 
    ),
    NavigationItem(
      icon: Icons.favorite,
      label: 'Favorites',
      page:  const FavouritesPage(), 
    ),
    NavigationItem(
      icon: Icons.settings,
      label: 'Settings',
      page: const SettingsPage(), 
    ),
  ];
}
