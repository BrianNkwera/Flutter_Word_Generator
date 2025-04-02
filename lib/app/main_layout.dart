import 'package:flutter/material.dart';
import '../shared_components/navigation/bottom_navigation.dart';
import '../shared_components/navigation/side_navigation.dart';
import '../shared_components/layout/responsive_layout.dart';
import '../shared_components/navigation/app_navigation.dart';

//Statefull widgets are widgets which manage their own internal state
//http://docs.flutter.dev/ui/interactivity
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  //method to change route
  //_stands for a private modifier
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: Scaffold(
        appBar: AppBar(
          title: const Text('Random Word Generator'),
        ),
        body: AppNavigationConfig.items[_selectedIndex].page,
        bottomNavigationBar: AppBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      desktopBody: Scaffold(
        body: Row(
          children: [
            AppNavigationRail(
              currentIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
            ),
            Expanded(
              child: AppNavigationConfig.items[_selectedIndex].page,
            ),
          ],
        ),
      ),
    );
  }
}
