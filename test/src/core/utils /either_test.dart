import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/src/core/utils/either.dart';

void main() {
  group('Either Test', () {
    test('Fold should execute ifLeft on Left', () {
      const Either<String, int> leftEither = Left('Error');
      final result = leftEither.fold(
        (left) => 'Left: $left',
        (right) => 'Right: $right',
      );

      expect(result, 'Left: Error');
    });

    test('Fold should execute ifRight on Right', () {
      const Either<String, int> rightEither = Right(42);
      final result = rightEither.fold(
        (left) => 'Left: $left',
        (right) => 'Right: $right',
      );

      expect(result, 'Right: 42');
    });

    test('isLeft should return true for Left', () {
      const Either<String, int> leftEither = Left('Error');

      expect(leftEither.isLeft, true);
    });

    test('isRight should return true for Right', () {
      const Either<String, int> rightEither = Right(42);

      expect(rightEither.isRight, true);
    });

    test('isLeft should return false for Right', () {
      const Either<String, int> rightEither = Right(42);

      expect(rightEither.isLeft, false);
    });

    test('isRight should return false for Left', () {
      const Either<String, int> leftEither = Left('Error');

      expect(leftEither.isRight, false);
    });
  });
}
