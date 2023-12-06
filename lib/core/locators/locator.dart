import 'package:get_it/get_it.dart';
import '../../core.dart';

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


