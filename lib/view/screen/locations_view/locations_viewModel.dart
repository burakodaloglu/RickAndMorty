import 'package:flutter/foundation.dart';
import 'package:rickandmorty/core/service/remote/character_api_service.dart';


import '../../../core/localization/locator.dart';
import '../../../model/locations_model.dart';

class LocationsViewmodel extends ChangeNotifier {
  final _apiService = locator<CharacterApiService>();

  LocationModel? _locationModel;
  LocationModel? get locationModel => _locationModel;

  void getLocations() async {
    _locationModel = await _apiService.getLocations();
    notifyListeners();
  }

  bool loadMore = false;
  void setLoadMore(bool value) {
    loadMore = value;
    notifyListeners();
  }

  int _page = 1;

  void getMoreLocation() async {
    if (loadMore && _page == _locationModel!.info.pages) return;
    setLoadMore(true);

    final data =
    await _apiService.getLocations(url: _locationModel!.info.next);
    _page++;

    _locationModel!.info = data.info;
    _locationModel!.locations.addAll(data.locations);

    setLoadMore(false);
  }
}
