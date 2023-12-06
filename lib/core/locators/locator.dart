import 'package:get_it/get_it.dart';

import 'locator_interactors.dart';
import 'locator_modules.dart';
import 'locator_screens.dart';

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


