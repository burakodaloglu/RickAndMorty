import 'package:flutter/material.dart';
import 'package:rickandmorty/core/service/remote/character_api_service.dart';

import '../../../core/localization/locator.dart';
import '../../../model/episode_model.dart';

class CharacterDetailViewmodel extends ChangeNotifier {
  final _apiService = locator<CharacterApiService>();

  List<EpisodeModel> _episodes = [];
  List<EpisodeModel> get episodes => _episodes;

  void getEpisodes(List<String> urlList) async {
    _episodes = await _apiService.getEpisodes(urlList);
    notifyListeners();
  }
}