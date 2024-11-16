import 'dart:convert';

import 'package:test_project/src/core/mixins/base_model.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';

class TableModel extends TableEntity implements BaseModel<TableModel> {
  const TableModel({
    required super.name,
    required super.orderItem,
    required super.id,
    required super.itemCount,
    required super.createdAt,
    required super.updatedAt,
  });

  factory TableModel.fromJson(
    Map<String, dynamic> json,
    List<MenuItemEntity>? orderItem,
  ) {
    return TableModel(
      orderItem: orderItem ?? const [],
      name: json['name'] as String,
      id: json['id'] as int,
      itemCount: json['item_count'] as int,
      createdAt: DateTime.parse(
        json['created_at'] as String,
      ),
      updatedAt: DateTime.parse(
        json['updated_at'] as String,
      ),
    );
  }

  factory TableModel.fromEntity(TableEntity entity) {
    return TableModel(
      orderItem: entity.orderItem,
      name: entity.name,
      id: entity.id,
      itemCount: entity.itemCount,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'order_item_id': jsonEncode(
        orderItem.map((element) => element.id).toList(),
      ),
      'name': name,
      'item_count': itemCount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  TableModel fromJson(Map<String, dynamic> json) => TableModel.fromJson(
        json,
        null,
      );
}
