// ignore_for_file: one_member_abstracts

import 'package:test_project/src/core/set_up/data/model/category_model.dart';
import 'package:test_project/src/core/set_up/data/model/menu_item_model.dart';
import 'package:test_project/src/core/set_up/domain/entities/category_entity.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';
import 'package:test_project/src/features/table/data/models/table_model.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';
import 'package:test_project/src/services/database_service.dart';

abstract class SetUpLocalDataSource {
  Future<void> saveInitialItems();
}

class SetUpLocalDataSourceImpl implements SetUpLocalDataSource {
  const SetUpLocalDataSourceImpl({
    required this.categoryDataBaseService,
    required this.menuItemDataBaseService,
    required this.tableDataBaseService,
  });

  final DatabaseService<CategoryEntity> categoryDataBaseService;
  final DatabaseService<MenuItemEntity> menuItemDataBaseService;
  final DatabaseService<TableEntity> tableDataBaseService;

  @override
  Future<void> saveInitialItems() async {
    final categories = [
      'Bento Box',
      'Build Your Own Ramen',
      'Cheesecake Series',
      'Desserts',
      'Drinks',
      'Extras',
      'Fruit Tea',
      'Hang-In Ramen',
      'Jam milky',
      'Japanese Grille',
      'Kid Menu',
      'Lemonade Paradise',
    ];

    final menuItemsIds = await _saveItems();
    List.generate(12, (index) async {
      await categoryDataBaseService.insert(
        CategoryModel.fromEntity(
          CategoryEntity(
            id: index,
            name: categories[index],
            items: menuItemsIds[index],
          ),
        ),
      );
    });

    List.generate(
      21,
      (index) async => tableDataBaseService.insert(
        TableModel.fromEntity(
          TableEntity(
            orderItem: const [],
            name: 'T${index + 1}',
            id: index,
            itemCount: 0,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ),
      ),
    );
  }

  Future<List<List<int>>> _saveItems() async {
    final menuItemsId = List.generate(12, (_) => <int>[]);
    for (final bentoBoxMenuItem in bentoBoxMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(bentoBoxMenuItem),
      );
      menuItemsId[0].add(id);
    }
    for (final buildYourOwnRamenMenuItem in buildYourOwnRamenMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(
          buildYourOwnRamenMenuItem,
        ),
      );
      menuItemsId[1].add(id);
    }
    for (final cheesecakeSeriesMenuItem in cheesecakeSeriesMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(cheesecakeSeriesMenuItem),
      );
      menuItemsId[2].add(id);
    }
    for (final dessertsMenuItem in dessertsMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(dessertsMenuItem),
      );
      menuItemsId[3].add(id);
    }
    for (final drinksMenuItem in drinksMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(drinksMenuItem),
      );
      menuItemsId[4].add(id);
    }
    for (final extrasMenuItem in extrasMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(extrasMenuItem),
      );
      menuItemsId[5].add(id);
    }
    for (final fruitTeaMenuItem in fruitTeaMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(fruitTeaMenuItem),
      );
      menuItemsId[6].add(id);
    }
    for (final hangInRamenMenuItem in hangInRamenMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(hangInRamenMenuItem),
      );
      menuItemsId[7].add(id);
    }
    for (final jamMilkyMenuItem in jamMilkyMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(jamMilkyMenuItem),
      );
      menuItemsId[8].add(id);
    }
    for (final japaneseGrilleMenuItem in japaneseGrilleMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(japaneseGrilleMenuItem),
      );
      menuItemsId[9].add(id);
    }
    for (final kidMenuMenuItem in kidMenuMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(kidMenuMenuItem),
      );
      menuItemsId[10].add(id);
    }
    for (final lemonadeParadiseMenuItem in lemonadeParadiseMenuItems) {
      final id = await menuItemDataBaseService.insert(
        MenuItemModel.fromEntity(lemonadeParadiseMenuItem),
      );
      menuItemsId[11].add(id);
    }
    return menuItemsId;
  }
}
