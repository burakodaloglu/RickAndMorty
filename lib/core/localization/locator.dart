import 'package:get_it/get_it.dart';

import '../service/CharacterApiService.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ApiService>(() => ApiService());
}