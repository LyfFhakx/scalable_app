import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:scalable_ddd_app/core.dart';
import 'package:scalable_ddd_app/data.dart';
import 'package:scalable_ddd_app/domain.dart';

import '../_mocks/_mocked_components/mock_client_adapter.dart';
import '../_mocks/_mocked_components/mock_default_cache_manager.dart';
import '../_mocks/_mocked_components/mock_go_router.dart';

///
/// Methods to initialize locator for testing
///
void serviceLocatorForTestInitialization() {
  _initializeMockModules();
  initializeInteractors();
  initializeScreens();
}

_initializeMockModules() {
  // For the API Service we will use the actual module but with a mocked http client
  getIt.registerLazySingleton<ApiService>(
        () => ApiService(),
  );
  getIt.registerLazySingleton<MockClientAdapter>(
        () => MockClientAdapter(dio: getIt<ApiService>().dio),
  );
  // For other modules we will usually use the mocked version
  getIt.registerLazySingleton<BaseCacheManager>(
        () => MockDefaultCacheManager(),
  );
}

///
/// Creates a testable widget for functional testing of views.
/// It also enables the inclusion of a custom list of providers to initialize
/// the view in a specific state.
///
Widget makeTestableWidget({
  required Widget child,
  List<ChangeNotifierProvider>? testProviders,
  MockGoRouter? mockGoRouter,
  Size? mediaQuerySize,
}) {
  return MultiProvider(
    providers: testProviders ?? defaultTestProviders,
    child: MediaQuery(
      data: MediaQueryData(size: mediaQuerySize ?? portrait),
      child: MaterialApp(
        home: mockGoRouter != null
            ? MockGoRouterProvider(
          goRouter: mockGoRouter,
          child: child,
        )
            : child,
      ),
    ),
  );
}

final defaultTestProviders = [
  ChangeNotifierProvider<ArticleListProvider>(
      create: (_) => ArticleListProvider()),
  ChangeNotifierProvider<User>(create: (_) => User(id: 'id', name: 'name')),
];

///
/// Frequently used values
///
const landscape = Size(800, 400);
const portrait = Size(400, 800);
const mediumScreen = Size(600, 800);
const largeScreen = Size(1200, 800);

const milliseconds10 = Duration(milliseconds: 10);
const milliseconds100 = Duration(milliseconds: 100);
const seconds1 = Duration(seconds: 1);
const seconds10 = Duration(seconds: 10);
final anyArticle = Article(
  id: 'id1',
  title: 'title',
  description: 'description',
  content: '<a href=url>content</a><img alt=""></img>',
  keywords: ['1', '2'],
  url: 'url',
  date: DateTime(2023),
);
final anyPremiumArticle = Article(
  id: 'id2',
  title: 'title',
  description: 'description<img width="100"></img>',
  content: '',
  keywords: ['1', '2'],
  url: 'url',
  date: DateTime(2023),
);
