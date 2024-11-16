import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_project/src/core/enums/enums.dart';
import 'package:test_project/src/core/utils/use_case.dart';
import 'package:test_project/src/di/locator.dart';
import 'package:test_project/src/features/order/domain/usecases/get_orders_use_case.dart';
import 'package:test_project/src/features/table/domain/entities/order_entity.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc({GetOrdersUseCase? getOrdersUseCase})
      : _getOrdersUseCase = getOrdersUseCase ?? locator(),
        super(const _Initial()) {
    on<_Started>(_onStarted);
  }
  final GetOrdersUseCase _getOrdersUseCase;

  FutureOr<void> _onStarted(
    _Started event,
    Emitter<OrderState> emit,
  ) async {
    await _getOrdersUseCase(NoParams()).then(
      (result) => result.fold(
        (error) => emit(
          state.copyWith(
            errorMessage: error.message,
            viewState: ViewState.error,
          ),
        ),
        (orders) => emit(
          state.copyWith(
            orders: orders..sort((a, b) => b.updatedAt.compareTo(a.updatedAt)),
            viewState: ViewState.success,
          ),
        ),
      ),
    );
    emit(
      state.copyWith(
        viewState: ViewState.idle,
        errorMessage: null,
      ),
    );
  }
}
