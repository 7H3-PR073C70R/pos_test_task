import 'package:dio/dio.dart';

extension ErrorHandler on Exception {
  String? get errorMessage {
    try {
      final error = this as DioException;
      final backendMessage =
          (error.response?.data as Map?)?['message'] as String?;
      final message = backendMessage ?? error.message ?? 'something went wrong';
      return message.toLowerCase().contains('failed host lookup')
          ? 'Please check your internet connection and try again'
          : message;
    } catch (e) {
      return null;
    }
  }
}
