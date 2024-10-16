import 'package:flutter/material.dart';
import 'package:rickandmorty/core/service/local/shared_preferences_helper.dart';
import 'package:rickandmorty/core/service/remote/character_api_service.dart';

import '../../../core/localization/locator.dart';
import '../../../model/character_model.dart';

class FavoritesViewmodel extends ChangeNotifier {
  final _preferencesService = locator<SharedPreferencesHelper>();
  final _apiService = locator<CharacterApiService>();

  List<int> _favourites = [];
  List<CharacterModel> _characters = [];

  List<CharacterModel> get characters => _characters;

  void getFavorites() {
    _favourites = _preferencesService.getSavedCharacters();
    _getCharacters();
  }

  void _getCharacters() async {
    _characters = await _apiService.getFavoritesCharacters(_favourites);
    notifyListeners();
  }
}