import 'package:dio/dio.dart';

extension DioExceptionExtension on DioException {
  String get errorMessage {
    final data = response?.data as Map?;
    return data?['message'] as String? ?? 'Something went wrong';
  }
}
