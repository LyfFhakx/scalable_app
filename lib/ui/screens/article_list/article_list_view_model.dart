import '../../../domain.dart';
import '../screens.dart';

/// article_list_view_model.dart

class ArticleListViewModel
    extends BaseViewModel<ArticleListVMState, ArticleListViewContract>
    implements ArticleListVMContract {
  final ArticleUseCases _articleInteractor;

  ArticleListViewModel({
    required ArticleUseCases articleInteractor,
  }) : _articleInteractor = articleInteractor;

  @override
  void onInitState() {
    // In the onInitwState the widget tree is not built yet hence the call to
    // notifyListener() is not needed
    vmState.isLoading = true;
    _refreshArticleList();
  }

  @override
  Future<void> requestArticleList() async {
    startLoadingState();
    await _refreshArticleList();
  }

  @override
  void tapOnArticle(int index) {
    viewContract.goToArticleDetailsScreen(index);
  }

  Future<void> _refreshArticleList() async {
    try {
      final articles = await _articleInteractor.getArticles();
      vmState.articleList.clear();
      vmState.articleVisibilityList.clear();
      vmState.articleList.addAll(articles);
      vmState.articleVisibilityList.addAll(articles.map((e) => true));
    } catch (e) {
      vmState.hasError = true;
      if (e is ApiError) {
      } else {}
    }
    stopLoadingState();
  }

  @override
  void tapOnHideArticle(int index) {
    vmState.articleVisibilityList[index] = false;
    notifyListeners();
  }

  @override
  void onDisposeView() {
    // TODO: implement onDisposeView
  }

  @override
  void onInitViewState() {
    // TODO: implement onInitViewState
  }
}