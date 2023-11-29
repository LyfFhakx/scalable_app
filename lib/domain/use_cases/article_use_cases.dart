

import '../models/models.dart';

abstract class ArticleUseCases {
  Future<List<Article>> getArticles();
}