import '../../../domain.dart';
import '../screens.dart';

class ArticleListVMState extends BaseViewModelState {
  final List<Article> articleList = [];
  final List<bool> articleVisibilityList = [];
}

abstract class ArticleListViewContract extends BaseViewContract {
  void goToArticleDetailsScreen(int index);
  void showErrorRetrievingArticlesSnackbar();
}

abstract class ArticleListVMContract
    extends BaseViewModelContract<ArticleListVMState, ArticleListViewContract> {
  void tapOnArticle(int index);
  void tapOnHideArticle(int index);
  void requestArticleList();
}