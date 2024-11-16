part of 'locator.dart';

Future<void> _initRepositoryLocator() async {
  locator..registerLazySingleton<SetUpRepository>(
    () => SetUpRepositoryImpl(
      locator(),
    ),
  )..registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(
        locator(),
      ),
    )..registerLazySingleton<TableRepository>(
      () => TableRepositoryImpl(
        locator(),
      ),
    );
}
