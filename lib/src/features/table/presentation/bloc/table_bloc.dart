import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project/src/core/enums/enums.dart';
import 'package:test_project/src/core/set_up/domain/entities/category_entity.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';
import 'package:test_project/src/core/utils/use_case.dart';
import 'package:test_project/src/di/locator.dart';
import 'package:test_project/src/features/order/domain/usecases/add_order_use_case.dart';
import 'package:test_project/src/features/table/domain/entities/order_entity.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';
import 'package:test_project/src/features/table/domain/usecases/get_categories_use_case.dart';
import 'package:test_project/src/features/table/domain/usecases/get_menu_item_use_case.dart';
import 'package:test_project/src/features/table/domain/usecases/get_tables_use_case.dart';
import 'package:test_project/src/features/table/domain/usecases/update_table_use_case.dart';

part 'table_event.dart';
part 'table_state.dart';
part 'table_bloc.freezed.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  TableBloc({
    GetCategoriesUseCase? getCategoriesUseCase,
    GetMenuItemUseCase? getMenuItemUseCase,
    GetTablesUseCase? getTablesUseCase,
    UpdateTableUseCase? updateTableUseCase,
    AddOrderUseCase? addOrderUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase ?? locator(),
        _getMenuItemUseCase = getMenuItemUseCase ?? locator(),
        _getTablesUseCase = getTablesUseCase ?? locator(),
        _updateTableUseCase = updateTableUseCase ?? locator(),
        _addOrderUseCase = addOrderUseCase ?? locator(),
        super(const _Initial()) {
    on<_Started>(_onStarted);
    on<_UpdatedSelectedTable>(_onUpdatedSelectedTable);
    on<_UpdatedSelectedCategory>(_onUpdatedSelectedCategory);
    on<_AddItemToTable>(_onAddItemToTable);
    on<_SaveTable>(_onSaveTable);
    add(const _Started());
  }

  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetMenuItemUseCase _getMenuItemUseCase;
  final GetTablesUseCase _getTablesUseCase;
  final UpdateTableUseCase _updateTableUseCase;
  final AddOrderUseCase _addOrderUseCase;

  FutureOr<void> _onStarted(
    _Started event,
    Emitter<TableState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));
    await Future.delayed(const Duration(seconds: 1), () {});
    final categories = await _getCategoriesUseCase(NoParams());
    final tables = await _getTablesUseCase(NoParams());
    emit(
      state.copyWith(
        viewState: ViewState.idle,
        categories: categories.fold(
          (error) => [],
          (categories) => categories,
        ),
        tables: tables.fold(
          (error) => [],
          (tables) =>
              tables..sort((a, b) => b.updatedAt.compareTo(a.updatedAt)),
        ),
      ),
    );
  }

  FutureOr<void> _onUpdatedSelectedTable(
    _UpdatedSelectedTable event,
    Emitter<TableState> emit,
  ) {
    emit(
      state.copyWith(
        selectedTable: event.table,
        selectedTableIndex: state.tables.indexOf(
          event.table,
        ),
      ),
    );
  }

  FutureOr<void> _onUpdatedSelectedCategory(
    _UpdatedSelectedCategory event,
    Emitter<TableState> emit,
  ) async {
    if (event.category == null) {
      emit(
        state.copyWith(
          selectedCategory: null,
          menuItems: [],
        ),
      );
      return;
    }
    final menuItemsResponse = await _getMenuItemUseCase(event.category!.items);
    emit(
      state.copyWith(
        menuItems: menuItemsResponse.fold(
          (error) => [],
          (menuItems) => menuItems,
        ),
        selectedCategory: event.category,
      ),
    );
  }

  FutureOr<void> _onAddItemToTable(
    _AddItemToTable event,
    Emitter<TableState> emit,
  ) async {
    if (state.selectedTable == null ||
        state.selectedTableIndex == null ||
        state.selectedTableIndex == -1) return;

    final tables = [...state.tables];

    final items = [
      ...state.selectedTable!.orderItem,
      event.item,
    ];

    tables.removeAt(state.selectedTableIndex!);
    final updatedTable = state.selectedTable!.copyWith(
      orderItem: items,
      itemCount: items.length,
      updatedAt: DateTime.now(),
    );

    tables.insert(state.selectedTableIndex!, updatedTable);

    emit(
      state.copyWith(
        selectedTable: updatedTable,
      ),
    );
  }

  FutureOr<void> _onSaveTable(
    _SaveTable event,
    Emitter<TableState> emit,
  ) async {
    if (state.selectedTable == null ||
        state.selectedTableIndex == null ||
        state.selectedTableIndex == -1) return;

    emit(state.copyWith(viewState: ViewState.processing));
    final saveOrderResponse = await _addOrderUseCase(
      OrderEntity(
        table: state.selectedTable!.copyWith(
          itemCount: state.selectedTable!.orderItem.length,
        ),
        id: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        status: 'unpaid',
        totalPrice: state.selectedTable!.orderItem.fold(
          0,
          (previous, item) => previous + item.price,
        ),
        paidAmount: 0,
      ),
    );
    if (saveOrderResponse.isRight) {
      await _updateTableUseCase(state.selectedTable!).then(
        (result) => result.fold(
          (error) => emit(
            state.copyWith(
              viewState: ViewState.error,
              errorMessage: error.message,
            ),
          ),
          (table) => emit(
            state.copyWith(
              viewState: ViewState.success,
              tables: ([...state.tables]..[state.selectedTableIndex!] = table)
                ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt)),
            ),
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: saveOrderResponse.fold(
            (error) => error.message,
            (_) => null,
          ),
        ),
      );
    }
    emit(
      state.copyWith(
        viewState: ViewState.idle,
        errorMessage: null,
      ),
    );
  }
}
