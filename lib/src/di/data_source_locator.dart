part of 'locator.dart';

void _initDataSource() {
  locator
    ..registerLazySingleton<SetUpLocalDataSource>(
      () => SetUpLocalDataSourceImpl(
        categoryDataBaseService: locator(),
        menuItemDataBaseService: locator(),
        tableDataBaseService: locator(),
      ),
    )
    ..registerLazySingleton<OrderLocalDataSource>(
      () => OrderLocalDataSourceImpl(
        locator(),
        locator(),
      ),
    )..registerLazySingleton<TableLocalDataSource>(
      () => TableLocalDataSourceImpl(
        locator(),
        locator(),
        locator(),
      ),
    );
}
