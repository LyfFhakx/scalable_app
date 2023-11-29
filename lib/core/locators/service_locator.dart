import '../../domain.dart';
import '../../ui.dart';
import 'locator.dart';

void initializeScreens() {
  // ArticleListView
  getIt.registerFactory<ArticleListVMContract>(
        () => ArticleListViewModel(articleInteractor: getIt<ArticleUseCases>()),
  );
  getIt.registerFactory<ArticleListVMState>(
        () => ArticleListVMState(),
  );

  // ArticleDetailsView
  // getIt.registerFactory<ArticleDetailsVMContract>(
  //       () => ArticleDetailsViewModel(),
  // );
  // getIt.registerFactory<ArticleDetailsVMState>(
  //       () => ArticleDetailsVMState(),
  // );
}