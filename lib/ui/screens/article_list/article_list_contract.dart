import '../../../domain.dart';
import '../screens.dart';

class ArticleListVMState extends BaseViewModelState {
  late final ArticleListProvider articleListProvider;
  late final String? initialArticleId;
  final List<bool> articleVisibilityList = [];
  List<Article> get articleList => articleListProvider.articleList;
}

abstract class ArticleListViewContract extends BaseViewContract {
  void goToArticleDetailsScreen(int index);
  void showErrorRetrievingArticlesSnackbar();
}

abstract class ArticleListVMContract
    extends BaseViewModelContract<ArticleListVMState, ArticleListViewContract> {
  void tapOnArticle(int index);
  void tapOnHideArticle(int index);
  void tapOnRefreshArticleList();
}