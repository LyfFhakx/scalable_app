import 'package:get_it/get_it.dart';
import 'package:scalable_ddd_app/core/locators/service_locator.dart';

import '../../data.dart';
import '../../domain.dart';
import 'locator_modules.dart';

final getIt = GetIt.instance;
bool _initialized = false;

void serviceLocatorInitialization() {
  if (!_initialized) {
    initializeModules();
    initializeInteractors();
    initializeScreens();
    _initialized = true;
  }
}

void initializeInteractors() {
  getIt.registerFactory<ArticleUseCases>(
        () => ArticleInteractor(apiService: getIt<ApiService>()),
  );
}