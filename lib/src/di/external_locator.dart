part of 'locator.dart';

void _initExternal() {
  locator
    ..registerLazySingleton<DatabaseService<TableEntity>>(
      () => DatabaseServiceImpl<TableModel>(
        tableName: 'sitting_table',
        databaseName: AppEnv.databaseName,
      ),
    )
    ..registerLazySingleton<DatabaseService<OrderEntity>>(
      () => DatabaseServiceImpl<OrderModel>(
        tableName: 'order_table',
        databaseName: AppEnv.databaseName,
      ),
    )
    ..registerLazySingleton<DatabaseService<MenuItemEntity>>(
      () => DatabaseServiceImpl<MenuItemModel>(
        tableName: 'menu_item',
        databaseName: AppEnv.databaseName,
      ),
    )
    ..registerLazySingleton<DatabaseService<CategoryEntity>>(
      () => DatabaseServiceImpl<CategoryModel>(
        tableName: 'category',
        databaseName: AppEnv.databaseName,
      ),
    )
    ..registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: AppEnv.apiBaseURL,
          contentType: 'application/json',
          connectTimeout: const Duration(seconds: 20),
        ),
      )..interceptors.addAll(
          [
            LoggingInterceptor(logger: locator()),
            TokenInterceptor(storageService: locator()),
            DataParserInterceptor(),
          ],
        ),
    )
    ..registerLazySingleton<Logger>(
      Logger.new,
    );
}
