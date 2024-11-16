import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/utils/either.dart';
import 'package:test_project/src/core/utils/use_case.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';
import 'package:test_project/src/features/table/domain/repositories/table_repository.dart';

class GetTablesUseCase implements UseCase<List<TableEntity>, NoParams> {
  const GetTablesUseCase(this._orderRepository);
  final TableRepository _orderRepository;
  @override
  Future<Either<Failure, List<TableEntity>>> call(NoParams params) {
    return _orderRepository.getTables();
  }
}
