import 'package:dio/dio.dart';
import '../../../model/character_model.dart';
import '../../../model/episode_model.dart';
import '../../../model/locations_model.dart';

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

  Future<List<CharacterModel>> getFavoritesCharacters(List<int> idList) async {
    try {
      final response = await _dio.get('/character/${idList.join(',')}');
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

  Future<LocationModel> getLocations({String? url}) async {
    try {
      final response = await _dio.get(url ?? '/location');
      return LocationModel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CharacterModel>> getCharactersFromUrlList(List<String> residentsUrl) async {
    final List<int> idList =
        residentsUrl.map((e) => int.parse(e.split('/').last)).toList();
    try {
      return await getFavoritesCharacters(idList);
    } catch (e) {
      rethrow;
    }
  }

  Future<EpisodesModel> getAllEpisodes({String? url}) async {
    try {
      final response = await _dio.get(url ?? '/episode');
      return EpisodesModel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
