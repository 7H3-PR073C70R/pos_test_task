import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/extensions/repository_extension.dart';
import 'package:test_project/src/core/set_up/domain/entities/category_entity.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';
import 'package:test_project/src/core/utils/either.dart';
import 'package:test_project/src/features/table/data/datasources/table_local_data_source.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';
import 'package:test_project/src/features/table/domain/repositories/table_repository.dart';

class TableRepositoryImpl implements TableRepository {
  const TableRepositoryImpl(this._localDataSource);
  final TableLocalDataSource _localDataSource;
  @override
  Future<Either<Failure, List<TableEntity>>> getTables() {
    return _localDataSource.getTables().makeRequest();
  }

  @override
  Future<Either<Failure, TableEntity>> updateTable(TableEntity table) {
    return _localDataSource.updateTable(table).makeRequest();
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() {
    return _localDataSource.getCategories().makeRequest();
  }

  @override
  Future<Either<Failure, List<MenuItemEntity>>> getMenuItems(List<int> ids) {
    return _localDataSource.getMenuItems(ids).makeRequest();
  }
}
