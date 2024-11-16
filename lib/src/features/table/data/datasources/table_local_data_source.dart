import 'dart:convert';

import 'package:test_project/src/core/error/exceptions.dart';
import 'package:test_project/src/core/set_up/data/model/category_model.dart';
import 'package:test_project/src/core/set_up/data/model/menu_item_model.dart';
import 'package:test_project/src/core/set_up/domain/entities/category_entity.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';
import 'package:test_project/src/features/table/data/models/table_model.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';
import 'package:test_project/src/services/database_service.dart';

abstract class TableLocalDataSource {
  Future<List<TableEntity>> getTables();
  Future<TableEntity> updateTable(TableEntity table);
  Future<TableEntity> getTableById(int id);
  Future<List<CategoryEntity>> getCategories();
  Future<List<MenuItemEntity>> getMenuItems(
    List<int> ids,
  );
}

class TableLocalDataSourceImpl implements TableLocalDataSource {
  const TableLocalDataSourceImpl(
    this._databaseService,
    this._menuItemDatabaseService,
    this._categoryDatabaseService,
  );

  final DatabaseService<TableEntity> _databaseService;
  final DatabaseService<MenuItemEntity> _menuItemDatabaseService;
  final DatabaseService<CategoryEntity> _categoryDatabaseService;

  @override
  Future<List<TableEntity>> getTables() async {
    final tablesResponse = await _databaseService.getAll();
    final tables = <TableModel>[];
    for (final tableResponse in tablesResponse) {
      final menuItemIds =
          (jsonDecode(tableResponse['order_item_id'] as String) as List)
              .map((e) => int.parse(e.toString()))
              .toList();
      tables.add(
        TableModel.fromJson(
          tableResponse,
          await getMenuItems(menuItemIds),
        ),
      );
    }
    return tables;
  }

  @override
  Future<TableEntity> updateTable(TableEntity table) async {
    await _databaseService.update(TableModel.fromEntity(table), table.id);
    return table;
  }

  @override
  Future<TableEntity> getTableById(int id) async {
    final tableResponse = await _databaseService.getById(id);
    if (tableResponse != null) {
      final menuItemIds =
          (jsonDecode(tableResponse['order_item_id'] as String) as List)
              .map((e) => int.parse(e.toString()))
              .toList();
      return TableModel.fromJson(
        tableResponse,
        await getMenuItems(menuItemIds),
      );
    }
    throw const CacheException(message: 'Failed to get table by ID');
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categories = await _categoryDatabaseService.getAll();
    return List<Map<String, dynamic>>.from(categories)
        .map(CategoryModel.fromJson)
        .toList()
        .cast();
  }

  @override
  Future<List<MenuItemEntity>> getMenuItems(List<int> ids) async {
    final menuItem = <MenuItemEntity>[];
    for (final menuItemId in ids) {
      final menuItemResponse =
          await _menuItemDatabaseService.getById(menuItemId);
      if (menuItemResponse != null) {
        menuItem.add(MenuItemModel.fromJson(menuItemResponse));
      }
    }
    return menuItem;
  }
}
