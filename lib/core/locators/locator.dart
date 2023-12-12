import 'package:get_it/get_it.dart';
import '../../core.dart';

final getIt = GetIt.instance;

Future<void> serviceLocatorInitialization() async {
  await getIt.reset();
  initializeModules();
  initializeInteractors();
  initializeScreens();
  await getIt.allReady();
}
