part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial({
    @Default(ViewState.idle) ViewState viewState,
    @Default([]) List<OrderEntity> orders,
    String? errorMessage,
  }) = _Initial;
}
