import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/feed/feed_screen.dart';
import 'features/store/store_screen.dart';
import 'features/builder/builder_screen.dart';
import 'features/profile/profile_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/feed',
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        // Shared shell with Material 3 NavigationBar
        final String location = state.location;
        int selectedIndex = 0;
        if (location.startsWith('/store')) selectedIndex = 1;
        if (location.startsWith('/builder')) selectedIndex = 2;
        if (location.startsWith('/profile')) selectedIndex = 3;

        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              switch (index) {
                case 0:
                  context.go('/feed');
                  break;
                case 1:
                  context.go('/store');
                  break;
                case 2:
                  context.go('/builder');
                  break;
                case 3:
                  context.go('/profile');
                  break;
              }
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
        );
      },
      routes: [
        GoRoute(
          path: '/feed',
          name: 'feed',
          builder: (context, state) => const FeedScreen(),
        ),
        GoRoute(
          path: '/store',
          name: 'store',
          builder: (context, state) => const StoreScreen(),
        ),
        GoRoute(
          path: '/builder',
          name: 'builder',
          builder: (context, state) => const BuilderScreen(),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
