import 'package:rickandmorty/core/service/local/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences prefs;

  SharedPreferencesHelper({required this.prefs});


  void storeCharacters(List<String> characters) async {
    await prefs.setStringList(SharedPreferencesKey.CHARACTERS.value, characters);
  }

  void saveCharacter(int id) async {
    final charactersList = prefs.getStringList(SharedPreferencesKey.CHARACTERS.value) ?? [];
    charactersList.add(id.toString());
    storeCharacters(charactersList);
  }

  void removeCharacter(int id) async {
    final charactersList = prefs.getStringList(SharedPreferencesKey.CHARACTERS.value) ?? [];
    charactersList.remove(id.toString());
    storeCharacters(charactersList);
  }

  List<int> getSavedCharacters() {
    final charactersList = prefs.getStringList(SharedPreferencesKey.CHARACTERS.value) ?? [];
    return charactersList.map((e) => int.parse(e)).toList();
  }
}