import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/utils/either.dart';
import 'package:test_project/src/features/table/domain/entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, OrderEntity>> addOrder(OrderEntity order);
  Future<Either<Failure, OrderEntity>> updateOrder(OrderEntity order);
}
