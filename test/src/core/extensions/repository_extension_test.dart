import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/src/core/error/exceptions.dart';
import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/extensions/repository_extension.dart';
import 'package:test_project/src/core/utils/either.dart';

void main() {
  group('RepositoryExtension Test', () {
    test('makeRequest should return Right with data on success', () async {
      final futureResult = Future.value('Success');
      final result = await futureResult.makeRequest();

      expect(result, isA<Right<Failure, String>>());
      expect(result.isRight, true);
      expect(result.isLeft, false);
    });

    test('makeRequest should return Left with ServerFailure on DioException',
        () async {
      final futureResult = Future<String>.error(
        DioException(requestOptions: RequestOptions()),
      ); // Adjust this line
      final result = await futureResult.makeRequest();

      expect(result, isA<Left<Failure, String>>());
      expect(result.isRight, false);
      expect(result.isLeft, true);
    });

    test('makeRequest should return Left with ServerFailure on ServerException',
        () async {
      final futureResult = Future<String>.error(const ServerException());
      final result = await futureResult.makeRequest();

      expect(result, isA<Left<Failure, String>>());
      expect(result.isRight, false);
      expect(result.isLeft, true);
    });

    test(
        'makeRequest should return Left with ServerFailure on other exceptions',
        () async {
      final futureResult = Future<String>.error(Exception('Some error'));
      final result = await futureResult.makeRequest();

      expect(result, isA<Left<Failure, String>>());
      expect(result.isRight, false);
      expect(result.isLeft, true);
    });
  });
}
