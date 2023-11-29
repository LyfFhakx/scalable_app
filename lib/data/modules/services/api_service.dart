import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/failures/api_error.dart';
import '../api/endpoints.dart';

class ApiService {
  ///this is public will be used to mock [apiService] requests during testing
  final Dio dio = Dio();

  bool get _runningTests =>
      kIsWeb == false && Platform.environment.containsKey('FLUTTER_TEST');

  ApiService() {
    if (!kReleaseMode && !_runningTests) {
      // this line can be excluded from coverage (no interceptor during tests)
      dio.interceptors.add(LogInterceptor(responseBody: true)); // coverage:ignore-line
    }
  }

  Future<Response> _sendRequest(Future<Response> request) async {
    try {
      return await request;
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<Response> getMediumRssFeed() async {
    return _sendRequest(
      dio.get(Endpoints.mediumRssFeed),
    );
  }

}

