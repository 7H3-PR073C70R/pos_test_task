import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/extensions/repository_extension.dart';
import 'package:test_project/src/core/utils/either.dart';
import 'package:test_project/src/features/order/data/datasources/order_local_data_source.dart';
import 'package:test_project/src/features/order/domain/repositories/order_repository.dart';
import 'package:test_project/src/features/table/domain/entities/order_entity.dart';

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl(this._dataSource);
  final OrderLocalDataSource _dataSource;
  @override
  Future<Either<Failure, OrderEntity>> addOrder(OrderEntity order) {
    return _dataSource.addOrder(order).makeRequest();
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() {
    return _dataSource.getOrders().makeRequest();
  }

  @override
  Future<Either<Failure, OrderEntity>> updateOrder(OrderEntity order) {
    return _dataSource.updateOrder(order).makeRequest();
  }
}
