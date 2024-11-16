part of 'table_bloc.dart';

@freezed
class TableEvent with _$TableEvent {
  const factory TableEvent.started() = _Started;
  const factory TableEvent.updatedSelectedTable(TableEntity table) =
      _UpdatedSelectedTable;
  const factory TableEvent.updatedSelectedCategory({
    CategoryEntity? category,
  }) = _UpdatedSelectedCategory;
  const factory TableEvent.addItemToTable(MenuItemEntity item) =
      _AddItemToTable;
  const factory TableEvent.saveTable() = _SaveTable;
}
