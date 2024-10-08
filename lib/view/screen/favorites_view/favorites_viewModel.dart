import 'package:flutter/material.dart';
import 'package:rickandmorty/model/character.dart';

import '../../../core/localization/locator.dart';
import '../../../core/service/local/shared_preferences_helper.dart';
import '../../../core/service/remote/character_api_service.dart';

class FavoritesViewmodel extends ChangeNotifier {
  final _sharedPreferencesHelper = locator<SharedPreferencesHelper>();
  final _apiService = locator<CharacterApiService>();

  List<int> _favoritedList = [];

  List<CharacterModel> _characters = [];

  List<CharacterModel> get characters => _characters;

  void getFavorites() async {
    _favoritedList = _sharedPreferencesHelper.getSavedCharacters();
    getCharacters();
  }

  void getCharacters() async {
    _characters = await _apiService.getFavoritesCharacters(_favoritedList);
    notifyListeners();
  }
}