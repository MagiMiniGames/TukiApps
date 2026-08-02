import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/feed/feed_screen.dart';
import 'features/store/store_screen.dart';
import 'features/builder/builder_screen.dart';
import 'features/profile/profile_screen.dart';

class TukiApps extends StatefulWidget {
  const TukiApps({super.key});

  @override
  State<TukiApps> createState() => _TukiAppsState();
}

class _TukiAppsState extends State<TukiApps> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    FeedScreen(),
    StoreScreen(),
    BuilderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TukiApps',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() => _currentIndex = index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dynamic_feed_outlined),
              selectedIcon: Icon(Icons.dynamic_feed),
              label: 'Feed',
            ),
            NavigationDestination(
              icon: Icon(Icons.storefront_outlined),
              selectedIcon: Icon(Icons.storefront),
              label: 'Store',
            ),
            NavigationDestination(
              icon: Icon(Icons.auto_awesome_outlined),
              selectedIcon: Icon(Icons.auto_awesome),
              label: 'Builder',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
