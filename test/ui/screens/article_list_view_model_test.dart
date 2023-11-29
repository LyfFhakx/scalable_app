// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:scalable_ddd_app/domain.dart';
// import 'package:scalable_ddd_app/ui.dart';
//
// import '../../_mocks/_mocked_components/generic_mocks.dart';
//
// void main() {
//   // create an instance of the viewModel and the viewModelState
//   late ArticleListViewModel viewModel;
//   late ArticleListVMState vmState;
//
//   // create a mocked instance of the component surrounding the viewModel
//   late MockArticleListView mockView;
//   late MockArticleInteractor mockArticleInteractor;
//
//   // this will run before each test, to setup our environment anew
//   setUp(() {
//     mockView = MockArticleListView();
//     vmState = ArticleListVMState();
//     mockArticleInteractor = MockArticleInteractor();
//     viewModel = ArticleListViewModel(articleInteractor: mockArticleInteractor);
//     viewModel.viewContract = mockView;
//     viewModel.vmState = vmState;
//   });
//
//   group('tapOnRefreshArticleList -', () {
//     test('successful, lists in state should be replaced', () async {
//       // set initial state and define mock behavior
//       vmState.articleList.addAll([anyArticle, anyArticle]);
//       vmState.articleVisibilityList.addAll([false, false]);
//       when(() => mockArticleInteractor.getArticles()).thenAnswer(
//             (_) => Future.value([anyArticle]),
//       );
//
//       // invoke method
//       viewModel.tapOnRefreshArticleList();
//
//       // check result
//       expect(vmState.isLoading, isTrue);
//       verify(() => mockArticleInteractor.getArticles());
//
//       // check async result
//       await Future.delayed(milliseconds10);
//       expect(vmState.isLoading, isFalse);
//       expect(vmState.hasError, isFalse);
//       expect(vmState.articleList.length, 1);
//       expect(vmState.articleVisibilityList.length, 1);
//       expect(vmState.articleVisibilityList.first, isTrue);
//     });
//     test('fail with ApiError, keep existing list, show snackbar', () async {
//       // set initial state and define mock behavior
//       vmState.articleList.addAll([anyArticle, anyArticle]);
//       vmState.articleVisibilityList.addAll([false, false]);
//       when(() => mockArticleInteractor.getArticles()).thenAnswer(
//             (_) => Future.error([ApiError(message: 'error')]),
//       );
//
//       // invoke method
//       viewModel.tapOnRefreshArticleList();
//
//       // check result
//       expect(vmState.isLoading, isTrue);
//       verify(() => mockArticleInteractor.getArticles());
//
//       // check async result
//       await Future.delayed(const Duration(milliseconds: 10));
//       expect(vmState.isLoading, isFalse);
//       expect(vmState.hasError, isTrue);
//       expect(vmState.articleList.length, 2);
//       expect(vmState.articleVisibilityList.length, 2);
//       verify(mockView.showErrorRetrievingArticlesSnackbar);
//     });
//
//     test('fail with another exception, keep lists, show snackbar', () {
//       // .....
//     });
//   });
//
//   test('tapOnHideArticle', () {
//     // set initial state
//     vmState.articleVisibilityList.addAll([true]);
//     // invoke method
//     viewModel.tapOnHideArticle(0);
//     // check result
//     expect(vmState.articleVisibilityList[0], isFalse);
//   });
// }