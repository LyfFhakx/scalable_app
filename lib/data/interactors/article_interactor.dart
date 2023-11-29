import 'package:webfeed_plus/webfeed_plus.dart';

import '../../domain.dart';
import '../modules/services/services.dart';

class ArticleInteractor implements ArticleUseCases {
  final ApiService apiService;

  ArticleInteractor({required this.apiService});

  @override
  Future<List<Article>> getArticles() async {
    final response = await apiService.getMediumRssFeed();
    final rssFeed = RssFeed.parse(response.data);
    return rssFeed.items?.map((e) => Article.fromRssItem(e)).toList() ?? [];
  }
}