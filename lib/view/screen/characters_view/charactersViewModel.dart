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

  bool loadMore = false;
  int currentPage = 1;

  void setLoadMore(bool value) {
    loadMore = value;
    notifyListeners();
  }

  void getCharactersMore() async {
    if (loadMore) return;

    if (_charactersModel?.info.pages == currentPage) return;
    setLoadMore(true);
    final moreData =
        await _apiService.getCharacters(url: _charactersModel?.info.next);

    setLoadMore(false);
    currentPage++;
    _charactersModel!.info = moreData.info;
    _charactersModel!.characters.addAll(moreData.characters);
    notifyListeners();
  }
}
