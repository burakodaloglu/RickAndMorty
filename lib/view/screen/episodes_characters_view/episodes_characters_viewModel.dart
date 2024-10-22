import 'package:flutter/cupertino.dart';
import 'package:rickandmorty/model/character_model.dart';
import 'package:rickandmorty/model/episode_model.dart';

import '../../../core/localization/locator.dart';
import '../../../core/service/remote/character_api_service.dart';

class EpisodesCharactersViewmodel extends ChangeNotifier {
  final _apiService = locator<CharacterApiService>();

  List<CharacterModel> _characters = [];

  List<CharacterModel> get characters => _characters;

  void getCharacters(EpisodeModel episodeModel) async {
    _characters =
        await _apiService.getCharactersFromUrlList(episodeModel.characters);
    notifyListeners();
  }
}
