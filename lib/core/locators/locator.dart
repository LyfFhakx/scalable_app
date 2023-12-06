import 'package:get_it/get_it.dart';

import 'interactors_locator.dart';
import 'locator_modules.dart';
import 'service_locator.dart';

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


