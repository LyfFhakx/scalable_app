import '../screens.dart';

class ArticleDetailsViewModel
    extends BaseViewModel<ArticleDetailsVMState, ArticleDetailsViewContract>
    implements ArticleDetailsVMContract {
  @override
  Future<void> tapOnRefreshPage() async {
    startLoadingState();
    // Let's use a fake delay of 1 seconds
    await Future.delayed(const Duration(seconds: 1));
    stopLoadingState();
  }

  @override
  void tapOnLink(String? url) {
    if (url != null) {
      viewContract.goToExternalLink(url);
    }
  }
}
