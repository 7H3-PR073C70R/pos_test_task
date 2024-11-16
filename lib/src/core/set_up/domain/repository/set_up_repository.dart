import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/utils/either.dart';

// ignore: one_member_abstracts
abstract class SetUpRepository {
  Future<Either<Failure, void>> saveInitialItems();
}
