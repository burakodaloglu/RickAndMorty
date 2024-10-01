import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/view/app_view.dart';

import '../view/screen/characters_view/characters_view.dart';
import '../view/screen/episodes_view/episodes_view.dart';
import '../view/screen/favorites_view/favorites_view.dart';
import '../view/screen/locations_view/locations_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const characters = '/';
  static const favorites = '/favorites';
  static const locations = '/locations';
  static const episodes = '/episodes';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.characters,
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppView(
              navigationShell: navigationShell,
            ),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
                path: AppRoutes.characters,
                builder: (context, state) => const CharactersView())
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: AppRoutes.favorites,
                builder: (context, state) => const FavoritesView())
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: AppRoutes.locations,
                builder: (context, state) => const LocationsView())
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: AppRoutes.episodes,
                builder: (context, state) => const EpisodesView())
          ])
        ]),
  ],
);
