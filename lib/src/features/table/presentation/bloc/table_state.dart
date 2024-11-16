part of 'table_bloc.dart';

@freezed
class TableState with _$TableState {
  const factory TableState.initial({
    @Default([]) List<CategoryEntity> categories,
    @Default([]) List<TableEntity> tables,
    @Default([]) List<MenuItemEntity> menuItems,
    @Default(ViewState.idle) ViewState viewState,
    TableEntity? selectedTable,
    int? selectedTableIndex,
    CategoryEntity? selectedCategory,
    String? errorMessage,
  }) = _Initial;
}
