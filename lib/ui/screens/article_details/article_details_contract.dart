import '../../../domain.dart';
import '../_base/base.dart';

class ArticleDetailsVMState extends BaseViewModelState {
  late final Article article;
}

abstract class ArticleDetailsViewContract extends BaseViewContract {
  void goToExternalLink(String url);
}

abstract class ArticleDetailsVMContract extends BaseViewModelContract<
    ArticleDetailsVMState, ArticleDetailsViewContract> {
  void tapOnRefreshPage();
  void tapOnLink(String? url);
}