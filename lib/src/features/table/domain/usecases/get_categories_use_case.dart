import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/set_up/domain/entities/category_entity.dart';
import 'package:test_project/src/core/utils/either.dart';
import 'package:test_project/src/core/utils/use_case.dart';
import 'package:test_project/src/features/table/domain/repositories/table_repository.dart';

class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, NoParams> {
  const GetCategoriesUseCase(this._orderRepository);
  final TableRepository _orderRepository;
  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) {
    return _orderRepository.getCategories();
  }
}
