import 'package:equatable/equatable.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';

class OrderEntity extends Equatable {
  const OrderEntity({
    required this.table,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.totalPrice,
    required this.paidAmount,
  });

  final TableEntity table;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String status;
  final num totalPrice;
  final num paidAmount;
  final int id;

  @override
  List<Object?> get props => [
        table,
        id,
        createdAt,
        updatedAt,
        status,
        totalPrice,
        paidAmount,
      ];
}
