import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/set_up/domain/entities/category_entity.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';
import 'package:test_project/src/core/utils/either.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';

abstract class TableRepository {
  Future<Either<Failure, List<TableEntity>>> getTables();
  Future<Either<Failure, TableEntity>> updateTable(TableEntity table);
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<MenuItemEntity>>> getMenuItems(
    List<int> ids,
  );
}
