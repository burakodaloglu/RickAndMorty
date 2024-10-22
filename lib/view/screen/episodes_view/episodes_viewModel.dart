import 'package:flutter/widgets.dart';
import 'package:rickandmorty/model/episode_model.dart';

import '../../../core/localization/locator.dart';
import '../../../core/service/remote/character_api_service.dart';

class EpisodesViewmodel extends ChangeNotifier {
  final _apiService = locator<CharacterApiService>();

  EpisodesModel? _episodesModel;
  EpisodesModel? get episodesModel => _episodesModel;

  void getEpisodes() async {
    _episodesModel = await _apiService.getAllEpisodes();
    notifyListeners();
  }

  bool loadMore = false;
  void setLoadMore(bool value) {
    loadMore = value;
    notifyListeners();
  }

  int _page = 1;

  void onLoadMore() async {
    if (loadMore && _page == _episodesModel!.info.pages) return;

    setLoadMore(true);
    final data =
    await _apiService.getAllEpisodes(url: _episodesModel?.info.next);
    _page++;
    _episodesModel!.info = data.info;
    _episodesModel!.episodes.addAll(data.episodes);

    setLoadMore(false);
  }
}
