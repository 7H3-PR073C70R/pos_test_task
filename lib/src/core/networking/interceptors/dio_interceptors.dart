// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:test_project/src/services/user_storage_service.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({this.logger});

  final Logger? logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger?.i('REQUEST[${options.method}] => URL: ${options.uri}\n'
        'REQUEST DATA => ${options.data}\n'
        'Headers: ${options.headers}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logger?.i(
      'RESPONSE[${response.statusCode}] =>'
      ' PATH:${response.requestOptions.path}\n'
      'RESPONSE DATA: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    logger?.e('ERROR[${err.requestOptions.uri}]\n'
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n'
        'ERROR[${err.response?.data}]');
    super.onError(err, handler);
  }
}

class TokenInterceptor extends Interceptor {
  TokenInterceptor({required this.storageService});

  final UserStorageService storageService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final someToken = storageService.getToken() ?? '';
    options.headers['Authorization'] = 'Bearer $someToken';
    super.onRequest(options, handler);
  }
}

class DataParserInterceptor extends Interceptor {
  DataParserInterceptor();

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    late Response<dynamic> modifiedResponse;
    try {
      modifiedResponse = Response<dynamic>(
        requestOptions: response.requestOptions,
        data: (response.data as Map<String, dynamic>)['data'],
        statusCode: response.statusCode,
        extra: response.extra,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        statusMessage: response.statusMessage,
      );
    } catch (e) {
      modifiedResponse = response;
    }

    super.onResponse(modifiedResponse, handler);
  }
}
