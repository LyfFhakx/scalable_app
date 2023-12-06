import 'package:mocktail/mocktail.dart';
import 'package:scalable_ddd_app/data.dart';
import 'package:scalable_ddd_app/ui.dart';

class MockApiService extends Mock implements ApiService {}

class MockNestedNavigator extends Mock implements NestedNavigator {}

class MockArticleInteractor extends Mock implements ArticleInteractor {}
