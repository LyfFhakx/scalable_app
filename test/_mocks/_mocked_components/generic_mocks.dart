

import 'package:mocktail/mocktail.dart';
import 'package:scalable_ddd_app/data.dart';
import 'package:scalable_ddd_app/ui.dart';

class MockApiService extends Mock implements ApiService{}
class MockArticleListView extends Mock implements ArticleListViewContract {}
class MockArticleInteractor extends Mock implements ArticleInteractor{}