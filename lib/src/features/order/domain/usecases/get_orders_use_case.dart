import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/utils/either.dart';
import 'package:test_project/src/core/utils/use_case.dart';
import 'package:test_project/src/features/order/domain/repositories/order_repository.dart';
import 'package:test_project/src/features/table/domain/entities/order_entity.dart';

class GetOrdersUseCase implements UseCase<List<OrderEntity>, NoParams> {
  const GetOrdersUseCase(this._orderRepository);
  final OrderRepository _orderRepository;
  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams params) {
   return _orderRepository.getOrders();
  }
}
