import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';
import 'package:test_project/src/core/utils/either.dart';
import 'package:test_project/src/core/utils/use_case.dart';
import 'package:test_project/src/features/table/domain/repositories/table_repository.dart';

class GetMenuItemUseCase implements UseCase<List<MenuItemEntity>, List<int>> {
  const GetMenuItemUseCase(this._orderRepository);
  final TableRepository _orderRepository;
  @override
  Future<Either<Failure, List<MenuItemEntity>>> call(List<int> params) {
    return _orderRepository.getMenuItems(params);
  }
}
