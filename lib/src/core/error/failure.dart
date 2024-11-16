import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message, this.statusCode);

  final String? message;
  final int? statusCode;
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({
    String? message,
    int? statusCode,
  }) : super(message, statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure({
    String? message,
  }) : super(message, 0);

  @override
  List<Object?> get props => [message, statusCode];
}
