import 'package:equatable/equatable.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';

class TableEntity extends Equatable {
  const TableEntity({
    required this.orderItem,
    required this.name,
    required this.id,
    required this.itemCount,
    required this.createdAt,
    required this.updatedAt,
  });

  TableEntity copyWith({
    List<MenuItemEntity>? orderItem,
    String? name,
    int? itemCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TableEntity(
      orderItem: orderItem ?? this.orderItem,
      name: name ?? this.name,
      itemCount: itemCount ?? this.itemCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id,
    );
  }

  final List<MenuItemEntity> orderItem;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final int itemCount;
  final int id;

  @override
  List<Object?> get props => [
        orderItem,
        name,
        id,
        itemCount,
      ];
}
