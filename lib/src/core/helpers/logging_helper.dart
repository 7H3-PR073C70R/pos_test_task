import 'dart:io' show stdout;
import 'package:dio/dio.dart';

import 'package:logger/logger.dart';

final Logger logger = Logger();

void logMessage(String message) {
  stdout.writeln(message);
}

void logError(Object error, StackTrace? trace, {bool crashlytics = true}) {
  logger.e('An Error Occurred', error: error, stackTrace: trace);

  if (error is DioException) {
    logger.e({
      'type': 'Response<---',
      'url': error.response?.realUri.toString(),
      'http_code': error.response?.statusCode,
      'response': error.response?.data ?? 'N/A',
    });
    if (error.response?.statusCode == 401) {
      return;
    }
  }
}

void logInfo(dynamic message) {
  logger.i(message);
}
