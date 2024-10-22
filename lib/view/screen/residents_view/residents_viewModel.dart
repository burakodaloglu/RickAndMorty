import 'package:flutter/widgets.dart';

import '../../../core/localization/locator.dart';
import '../../../core/service/remote/character_api_service.dart';
import '../../../model/character_model.dart';

class ResidentsViewmodel extends ChangeNotifier {
  final _apiService = locator<CharacterApiService>();

  List<CharacterModel> _residents = [];

  List<CharacterModel> get residents => _residents;

  void getResidents(List residentsUrl) async {
    _residents = await _apiService.getCharactersFromUrlList(residentsUrl.map((e) => e.toString()).toList());
    notifyListeners();
  }
}
