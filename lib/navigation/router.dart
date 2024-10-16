import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/view/screen/characters_detail_view/character_detail_viewModel.dart';
import 'package:rickandmorty/view/screen/episodes_view/episodes_view.dart';
import 'package:rickandmorty/view/screen/favorites_view/favorites_view.dart';
import 'package:rickandmorty/view/screen/locations_view/locations_viewModel.dart';
import 'package:rickandmorty/view/screen/residents_view/residents_view.dart';
import 'package:rickandmorty/view/screen/residents_view/residents_viewModel.dart';

import '../model/character_model.dart';
import '../model/locations_model.dart';
import '../view/app_view.dart';
import '../view/screen/characters_detail_view/characters_detail_view.dart';
import '../view/screen/characters_view/charactersViewModel.dart';
import '../view/screen/characters_view/characters_view.dart';
import '../view/screen/favorites_view/favorites_viewModel.dart';
import '../view/screen/locations_view/locations_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const String characters = '/';
  static const String favourites = '/favourites';
  static const String locations = '/locations';
  static const String sections = '/sections';

  static const String detail = 'charactersDetail';
  static const String charactersDetail = '/charactersDetail';

  static const String residentsRoute = 'residentsDetail';
  static const String residents = '/locations/residentsDetail';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.characters,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: AppRoutes.characters,
                builder: (context, state) => ChangeNotifierProvider(
                      create: (context) => CharactersViewmodel(),
                      child: const CharactersView(),
                    ),
                routes: [
                  GoRoute(
                    path: AppRoutes.detail,
                    builder: (context, state) => ChangeNotifierProvider(
                        create: (context) => CharacterDetailViewmodel(),
                        child: CharactersDetailView(
                            characterModel: state.extra as CharacterModel)),
                  )
                ]),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favourites,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => FavoritesViewmodel(),
                child: const FavoritesView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: AppRoutes.locations,
                builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => LocationsViewmodel(),
                    child: const LocationsView()),
                routes: [
                  GoRoute(
                      path: AppRoutes.residentsRoute,
                      builder: (context, state) => ChangeNotifierProvider(
                            create: (context) => ResidentsViewmodel(),
                            child: ResidentsView(
                                locationItem: state.extra as LocationItem),
                          )),
                ]),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.sections,
              builder: (context, state) => const EpisodesView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
