import '../../core.dart';
import '../../data.dart';
import '../../domain.dart';

void initializeInteractors() {
  getIt.registerFactory<ArticleUseCases>(
        () => ArticleInteractor(apiService: getIt<ApiService>()),
  );
}