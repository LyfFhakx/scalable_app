import '../../domain.dart';
import '../../ui.dart';
import 'locator.dart';

void initializeScreens() {
  // HomeView
  getIt.registerFactory<HomeVMContract>(
        () => HomeViewModel(),
  );
  getIt.registerFactory<HomeVMState>(
        () => HomeVMState(),
  );
  getIt.registerFactoryParam<HomeView, NestedNavigator, void>(
        (nestedNavigator, _) => HomeView(nestedNavigator: nestedNavigator),
  );

  // ArticleListView
  getIt.registerFactory<ArticleListVMContract>(
        () => ArticleListViewModel(articleInteractor: getIt<ArticleUseCases>()),
  );
  getIt.registerFactory<ArticleListVMState>(
          () => ArticleListVMState()
  );
  getIt.registerFactoryParam<ArticleListView, String?, void>(
        (articleId, _) => ArticleListView(initialArticleId: articleId),
  );

  // ArticleDetailsView
  getIt.registerFactory<ArticleDetailsVMContract>(
          () => ArticleDetailsViewModel()
  );
  getIt.registerFactory<ArticleDetailsVMState>(
          () => ArticleDetailsVMState()
  );
  getIt.registerFactoryParam<ArticleDetailsView, Article, void>(
        (article, _) => ArticleDetailsView(article: article),
  );
}