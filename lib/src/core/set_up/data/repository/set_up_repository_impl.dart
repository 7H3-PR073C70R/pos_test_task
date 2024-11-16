import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/extensions/repository_extension.dart';
import 'package:test_project/src/core/set_up/data/data_source/set_up_local_data_source.dart';
import 'package:test_project/src/core/set_up/domain/repository/set_up_repository.dart';
import 'package:test_project/src/core/utils/either.dart';

class SetUpRepositoryImpl implements SetUpRepository {
  const SetUpRepositoryImpl(this._dataSource);
  final SetUpLocalDataSource _dataSource;
  
  @override
  Future<Either<Failure, void>> saveInitialItems() {
   return _dataSource.saveInitialItems().makeRequest();
  }
}
