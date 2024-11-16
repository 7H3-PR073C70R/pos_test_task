part of 'locator.dart';

Future<void> _initUseCaseLocator() async {
  locator
    ..registerLazySingleton<SaveInitialItemsUseCase>(
      () => SaveInitialItemsUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<AddOrderUseCase>(
      () => AddOrderUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetOrdersUseCase>(
      () => GetOrdersUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<UpdateOrderUseCase>(
      () => UpdateOrderUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetTablesUseCase>(
      () => GetTablesUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetCategoriesUseCase>(
      () => GetCategoriesUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetMenuItemUseCase>(
      () => GetMenuItemUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<UpdateTableUseCase>(
      () => UpdateTableUseCase(
        locator(),
      ),
    );
}
