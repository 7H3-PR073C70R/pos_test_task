import 'package:test_project/src/features/table/data/datasources/table_local_data_source.dart';
import 'package:test_project/src/features/table/data/models/order_model.dart';
import 'package:test_project/src/features/table/domain/entities/order_entity.dart';
import 'package:test_project/src/services/database_service.dart';

abstract class OrderLocalDataSource {
  Future<List<OrderEntity>> getOrders();
  Future<OrderEntity> addOrder(OrderEntity order);
  Future<OrderEntity> updateOrder(OrderEntity order);
}

class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  const OrderLocalDataSourceImpl(
    this._databaseService,
    this._tableDataSource,
  );
  final DatabaseService<OrderEntity> _databaseService;
  final TableLocalDataSource _tableDataSource;

  @override
  Future<OrderEntity> addOrder(OrderEntity order) async {
    await _databaseService.insert(OrderModel.fromEntity(order));
    return order;
  }

  @override
  Future<List<OrderEntity>> getOrders() async {
    final ordersResponse = await _databaseService.getAll();
    final orders = <OrderEntity>[];
    for (final response in ordersResponse) {
      final tableJson =
          await _tableDataSource.getTableById(response['table_id'] as int);
      orders.add(
        OrderModel.fromJson(response, tableJson),
      );
    }
    return orders;
  }

  @override
  Future<OrderEntity> updateOrder(OrderEntity order) async {
    await _databaseService.update(OrderModel.fromEntity(order), order.id);
    return order;
  }
}
