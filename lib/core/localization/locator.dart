import 'package:get_it/get_it.dart';
import 'package:rickandmorty/core/service/local/shared_preferences_helper.dart';
import 'package:rickandmorty/core/service/remote/character_api_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferencesHelper>(
          () => SharedPreferencesHelper(prefs: prefs));

  locator.registerLazySingleton<CharacterApiService>(() => CharacterApiService());
}