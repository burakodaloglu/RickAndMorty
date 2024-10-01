import 'package:flutter/material.dart';
import '../../../core/localization/locator.dart';
import '../../../core/service/CharacterApiService.dart';
import '../../../model/character.dart';

class CharactersViewmodel extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  CharactersModel? _charactersModel;
  CharactersModel? get charactersModel => _charactersModel;

  void getCharacters() async {
    _charactersModel = await _apiService.getCharacters();
    notifyListeners();
  }
}