import 'package:dio/dio.dart';

import '../../model/character.dart';

class ApiService {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<CharactersModel> getCharacters({String? url,Map<String,dynamic>? params}) async {
    try {
      final response = await _dio.get(url ?? '/character',queryParameters: params);
      return CharactersModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}