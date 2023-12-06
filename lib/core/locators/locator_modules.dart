import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../data.dart';
import 'locator.dart';

void initializeModules() {
  getIt.registerSingleton<ApiService>(
    ApiService(),
  );
  getIt.registerLazySingleton<BaseCacheManager>(
        () => DefaultCacheManager(),
  );
}