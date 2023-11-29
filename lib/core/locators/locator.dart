import 'package:get_it/get_it.dart';

import '../../data.dart';
import '../../domain.dart';

final getIt = GetIt.instance;
bool _initialized = false;

void serviceLocatorInitialization() {
  if (!_initialized) {
    initializeModules();
    initializeInteractors();
    _initialized = true;
  }
}

void initializeModules() {
  getIt.registerSingleton<ApiService>(
    ApiService(),
  );
}

void initializeInteractors() {
  getIt.registerFactory<ArticleUseCases>(
        () => ArticleInteractor(apiService: getIt<ApiService>()),
  );
}