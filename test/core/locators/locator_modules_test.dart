import 'package:flutter_test/flutter_test.dart';
import 'package:scalable_ddd_app/core.dart';
import 'package:scalable_ddd_app/data.dart';
import 'package:scalable_ddd_app/domain.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    serviceLocatorInitialization();
    await getIt.allReady();
  });

  test('ApiService get initialized', () {
    expect(getIt<ApiService>(), isA<ApiService>());
  });

  test('ArticleUsesCases get initialized with ArticleInteractor', () {
    expect(getIt<ArticleUseCases>(), isA<ArticleInteractor>());
  });
}