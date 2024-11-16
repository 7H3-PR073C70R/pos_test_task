import 'dart:convert';
import 'package:test_project/src/core/mixins/base_model.dart';
import 'package:test_project/src/features/table/domain/entities/order_entity.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';

class OrderModel extends OrderEntity implements BaseModel<OrderModel> {
  const OrderModel({
    required super.table,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.status,
    required super.totalPrice,
    required super.paidAmount,
  });

  factory OrderModel.fromJson(
    Map<String, dynamic> json,
    TableEntity? table,
  ) {
    return OrderModel(
      createdAt: DateTime.parse(
        json['created_at'] as String,
      ),
      updatedAt: DateTime.parse(
        json['updated_at'] as String,
      ),
      status: json['status'] as String,
      totalPrice: json['total_price'] as double,
      paidAmount: json['paid_amount'] as double,
      table: table ??
          TableEntity(
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            id: 0,
            itemCount: 0,
            name: '',
            orderItem: const [],
          ),
      id: json['id'] as int,
    );
  }

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      status: entity.status,
      totalPrice: entity.totalPrice,
      paidAmount: entity.paidAmount,
      table: entity.table,
      id: entity.id,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'table_id': jsonEncode(
        table.id,
      ),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'status': status,
      'total_price': totalPrice,
      'paid_amount': paidAmount,
    };
  }

  @override
  OrderModel fromJson(Map<String, dynamic> json) => OrderModel.fromJson(
        json,
        null,
      );
}
