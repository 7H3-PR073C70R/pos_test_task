// ignore_for_file: lines_longer_than_80_chars, comment_references

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_project/src/core/error/exceptions.dart';
import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/utils/either.dart';
import 'package:test_project/src/core/utils/error_message_handler.dart';

extension RepositoryExtension<T> on Future<T> {
  ///
  /// Asynchronously makes a request to the server and handles exceptions.
  ///
  /// Returns a [Future] that resolves to an [Either] object, which represents either
  /// a successful response ([Right]) containing the data, or a failure ([Left]) with
  /// an appropriate error message.
  ///
  /// Optionally, you can provide [onSuccess] and [onFailure] callbacks to execute
  /// when the request succeeds or fails, respectively.
  ///
  /// Exceptions such as [DioException] and [ServerException] are caught and mapped to
  /// a [ServerFailure] containing the error message. For any other exceptions, a generic
  /// error message is returned.
  ///
  /// Debug information including exception details and stack traces are printed for diagnostic
  /// purposes in debug mode. Make sure to remove these debug statements in production code.
  ///
  /// Example usage:
  /// ```dart
  /// final response = await dataSource.getClaims().makeRequest(
  ///  onSuccess: (data) {
  ///     // Handle successful response
  ///     print('Request successful');
  ///   },
  ///   onFailure: (failure) {
  ///     // Handle failure
  ///     print('Error message: ${failure.message}');
  ///   },
  /// );
  ///
  /// response.fold(
  ///   (failure) {
  ///     // Handle failure
  ///     print('Error message: ${failure.message}');
  ///   },
  ///   (data) {
  ///     // Handle success
  ///     print('Received data: $data');
  ///   },
  /// );
  ///
  /// print(response.isRight); // prints true if the request was successful.
  /// print(response.isLeft); // prints true if the request failed.
  /// ```
  ///
  /// Ensure that the [Failure] and [ServerFailure] classes are defined and imported in your
  /// project for proper error handling.
  ///
  ////// Asynchronously makes a request to the server and handles exceptions.
  ///
  /// Returns a [Future] that resolves to an [Either] object, which represents either
  /// a successful response ([Right]) containing the data, or a failure ([Left]) with
  /// an appropriate error message.
  ///
  /// Optionally, you can provide [onSuccess] and [onFailure] callbacks to execute
  /// when the request succeeds or fails, respectively.
  ///
  /// Exceptions such as [DioException] and [ServerException] are caught and mapped to
  /// a [ServerFailure] containing the error message. For any other exceptions, a generic
  /// error message is returned.
  ///
  /// Debug information including exception details and stack traces are printed for diagnostic
  /// purposes in debug mode. Make sure to remove these debug statements in production code.
  ///
  /// Example usage:
  /// ```dart
  /// final response = await dataSource.getClaims().makeRequest(
  ///  onSuccess: (data) {
  ///     // Handle successful response
  ///     print('Request successful');
  ///   },
  ///   onFailure: (failure) {
  ///     // Handle failure
  ///     print('Error message: ${failure.message}');
  ///   },
  /// );
  ///
  /// response.fold(
  ///   (failure) {
  ///     // Handle failure
  ///     print('Error message: ${failure.message}');
  ///   },
  ///   (data) {
  ///     // Handle success
  ///     print('Received data: $data');
  ///   },
  /// );
  ///
  /// print(response.isRight); // prints true if the request was successful.
  /// print(response.isLeft); // prints true if the request failed.
  /// ```
  ///
  /// Ensure that the [Failure] and [ServerFailure] classes are defined and imported in your
  /// project for proper error handling.
  ///
  ///
  Future<Either<Failure, T>> makeRequest({
    ValueChanged<T>? onSuccess,
    VoidCallback? onFailure,
  }) async {
    try {
      final data = await this;
      onSuccess?.call(data);
      return Right(data);
    } on DioException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      debugPrintStack();
      return Left(
        ServerFailure(
          message: e.errorMessage,
        ),
      );
    } on ServerException catch (e, s) {
      onFailure?.call();
      debugPrint(e.toString());
      debugPrint(s.toString());
      debugPrintStack();
      return Left(
        ServerFailure(
          message: e.errorMessage,
        ),
      );
    } on CacheException catch (e, s) {
      onFailure?.call();
      debugPrint(e.toString());
      debugPrint(s.toString());
      debugPrintStack();
      return Left(
        CacheFailure(
          message: e.message,
        ),
      );
    } catch (e, s) {
      onFailure?.call();
      debugPrint(e.toString());
      debugPrint(s.toString());
      debugPrintStack();
      return const Left(
        ServerFailure(
          message: 'Something went wrong. Please try again',
        ),
      );
    }
  }
}
