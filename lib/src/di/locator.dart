import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:test_project/src/core/constants/app_env.dart';
import 'package:test_project/src/core/networking/interceptors/dio_interceptors.dart';
import 'package:test_project/src/core/set_up/data/data_source/set_up_local_data_source.dart';
import 'package:test_project/src/core/set_up/data/model/category_model.dart';
import 'package:test_project/src/core/set_up/data/model/menu_item_model.dart';
import 'package:test_project/src/core/set_up/data/repository/set_up_repository_impl.dart';
import 'package:test_project/src/core/set_up/domain/entities/category_entity.dart';
import 'package:test_project/src/core/set_up/domain/entities/menu_item_entity.dart';
import 'package:test_project/src/core/set_up/domain/repository/set_up_repository.dart';
import 'package:test_project/src/core/set_up/domain/use_case/save_initial_items_use_case.dart';
import 'package:test_project/src/features/order/data/datasources/order_local_data_source.dart';
import 'package:test_project/src/features/order/data/repositories/order_repository_impl.dart';
import 'package:test_project/src/features/order/domain/repositories/order_repository.dart';
import 'package:test_project/src/features/order/domain/usecases/add_order_use_case.dart';
import 'package:test_project/src/features/order/domain/usecases/get_orders_use_case.dart';
import 'package:test_project/src/features/order/domain/usecases/update_order_use_case.dart';
import 'package:test_project/src/features/table/data/datasources/table_local_data_source.dart';
import 'package:test_project/src/features/table/data/models/order_model.dart';
import 'package:test_project/src/features/table/data/models/table_model.dart';
import 'package:test_project/src/features/table/data/repositories/table_repository_impl.dart';
import 'package:test_project/src/features/table/domain/entities/order_entity.dart';
import 'package:test_project/src/features/table/domain/entities/table_entity.dart';
import 'package:test_project/src/features/table/domain/repositories/table_repository.dart';
import 'package:test_project/src/features/table/domain/usecases/get_categories_use_case.dart';
import 'package:test_project/src/features/table/domain/usecases/get_menu_item_use_case.dart';
import 'package:test_project/src/features/table/domain/usecases/get_tables_use_case.dart';
import 'package:test_project/src/features/table/domain/usecases/update_table_use_case.dart';
import 'package:test_project/src/services/database_service.dart';
import 'package:test_project/src/services/local_storage_service.dart';
import 'package:test_project/src/services/user_storage_service.dart';

part 'client_locator.dart';
part 'data_source_locator.dart';
part 'external_locator.dart';
part 'repository_locator.dart';
part 'service_locator.dart';
part 'use_case_locator.dart';

final locator = GetIt.instance;

void initLocator() {
  _initExternal();
  _initClients();
  _initDataSource();
  _initRepositoryLocator();
  _initUseCaseLocator();
  _initServices();
}
