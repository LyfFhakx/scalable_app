import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:scalable_ddd_app/data.dart';
import 'package:scalable_ddd_app/domain.dart';


import '_mocks/_mocked_components/generic_mocks.dart';
import '_mocks/_mocked_data/medium_rss_feed_mocked.dart';

void main() {
  ArticleInteractor? articleInteractor;
  final mockApiService = MockApiService();

  setUp(() {
    articleInteractor = ArticleInteractor(apiService: mockApiService);
  });

  test('Successfully get articles from RSS fields', () async {
    when(() => mockApiService.getMediumRssFeed()).thenAnswer(
          (_) => Future.value(
        Response(
          data: MediumRssFeedMocked.string_200,
          requestOptions: RequestOptions(),
        ),
      ),
    );

    final result = await articleInteractor!.getArticles();

    verify(() => mockApiService.getMediumRssFeed());
    expect(result.length, 1);
    expect(result.first, isInstanceOf<Article>());
  });
}

