import 'package:dio/dio.dart';
import 'package:rickandmorty/model/episode_model.dart';

import '../../../model/character.dart';

class CharacterApiService {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<CharactersModel> getCharacters(
      {String? url, Map<String, dynamic>? args}) async {
    try {
      final response =
          await _dio.get(url ?? '/character', queryParameters: args);
      return CharactersModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CharacterModel>> getFavoritesCharacters(List<int> id) async {
    try {
      final response = await _dio.get('/character/${id.join(',')}');
      return (response.data as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<EpisodeModel>> getEpisodes(List<String> list) async {
    try {
      final List<String> episodeNumbers =
      list.map((e) => e.split('/').last).toList();

      String episodes = episodeNumbers.join(',');
      if (list.length == 1) episodes = '$episodes,';

      final response = await _dio.get('/episode/$episodes');
      return (response.data as List)
          .map((e) => EpisodeModel.fromMap(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
