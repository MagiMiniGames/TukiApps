import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/feed/feed_screen.dart';
import 'features/feed/feed_detail.dart';
import 'features/store/store_screen.dart';
import 'features/builder/builder_screen.dart';
import 'features/profile/profile_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _feedNavigatorKey = GlobalKey<NavigatorState>();
final _storeNavigatorKey = GlobalKey<NavigatorState>();
final _builderNavigatorKey = GlobalKey<NavigatorState>();
final _profileNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/feed',
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
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
        // Feed tab with its own navigator stack
        ShellRoute(
          navigatorKey: _feedNavigatorKey,
          routes: [
            GoRoute(
              path: '/feed',
              name: 'feed',
              builder: (context, state) => const FeedScreen(),
            ),
            GoRoute(
              path: '/feed/item/:id',
              name: 'feed_item',
              builder: (context, state) {
                final id = state.params['id']!;
                return FeedDetailScreen(itemId: id);
              },
            ),
          ],
        ),

        // Store tab with its own navigator
        ShellRoute(
          navigatorKey: _storeNavigatorKey,
          routes: [
            GoRoute(
              path: '/store',
              name: 'store',
              builder: (context, state) => const StoreScreen(),
            ),
            // future: add store detail routes here
          ],
        ),

        // Builder tab
        ShellRoute(
          navigatorKey: _builderNavigatorKey,
          routes: [
            GoRoute(
              path: '/builder',
              name: 'builder',
              builder: (context, state) => const BuilderScreen(),
            ),
          ],
        ),

        // Profile tab
        ShellRoute(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
