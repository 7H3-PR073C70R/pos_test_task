// ignore_for_file: lines_longer_than_80_chars

import 'package:equatable/equatable.dart';

abstract class Either<L, R> extends Equatable {
  /// Represents a disjoint union of two types: [Left] or [Right].
  ///
  /// An [Either] object holds either a value of type [L] (Left) or a value of type [R] (Right).
  /// It provides utility methods like [fold], [isLeft], and [isRight] to work with the held value.
  const Either();

  /// Executes one of the provided functions based on whether the Either is Left or Right.
  ///
  /// If the Either is Left, the [ifLeft] function is executed with the Left value.
  /// If the Either is Right, the [ifRight] function is executed with the Right value.
  T fold<T>(T Function(L left) ifLeft, T Function(R right) ifRight) {
    if (this is Left<L, R>) {
      return ifLeft((this as Left<L, R>).value);
    } else if (this is Right<L, R>) {
      return ifRight((this as Right<L, R>).value);
    }
    throw Exception('unknown Either type');
  }

  /// Returns true if this Either is of type Left.
  bool get isLeft => this is Left<L, R>;

  /// Returns true if this Either is of type Right.
  bool get isRight => this is Right<L, R>;
}

class Left<L, R> extends Either<L, R> {
  /// Represents the Left side of an Either object.
  ///
  /// A [Left] object holds a value of type [L].
  const Left(this.value);
  final L value;

  @override
  List<Object?> get props => [value];
}

class Right<L, R> extends Either<L, R> {
  /// Represents the Right side of an Either object.
  ///
  /// A [Right] object holds a value of type [R]
  const Right(this.value);
  final R value;

  @override
  List<Object?> get props => [value];
}
