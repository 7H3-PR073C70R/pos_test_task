import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/src/core/error/exceptions.dart';
import 'package:test_project/src/core/utils/error_message_handler.dart';

void main() {
  group('ErrorHandler Extension Test', () {
    test('errorMessage should return correct message from DioException', () {
      //! Arrange
      final dioException = DioException(
        response: Response(
          data: {'message': 'Backend error message'},
          statusCode: 500,
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/api/endpoint'),
      );

      //! Act
      final errorMessage = dioException.errorMessage;

      //! Assert
      expect(errorMessage, 'Backend error message');
    });

    test(
        'errorMessage should return DioException message if no'
        ' backend message', () {
      //! Arrange
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/endpoint'),
      );

      //! Act
      final errorMessage = dioException.errorMessage;

      //! Assert
      expect(errorMessage, 'something went wrong');
    });

    test('errorMessage should handle failed host lookup message', () {
      final dioException = DioException(
        message: 'Failed host lookup: Domain not found',
        requestOptions: RequestOptions(path: '/api/endpoint'),
      );

      final errorMessage = dioException.errorMessage;

      expect(
        errorMessage,
        'Please check your internet connection and try again',
      );
    });

    test('errorMessage should return null for non-DioException', () {
      const customException = ServerException();

      final errorMessage = customException.errorMessage;

      expect(errorMessage, null);
    });
  });
}
