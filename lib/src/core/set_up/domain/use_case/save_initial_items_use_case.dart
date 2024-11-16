import 'package:test_project/src/core/error/failure.dart';
import 'package:test_project/src/core/set_up/domain/repository/set_up_repository.dart';
import 'package:test_project/src/core/utils/either.dart';
import 'package:test_project/src/core/utils/use_case.dart';

class SaveInitialItemsUseCase implements UseCase<void, NoParams> {
  const SaveInitialItemsUseCase(this._setUpRepository);
  final SetUpRepository _setUpRepository;
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _setUpRepository.saveInitialItems();
  }
}
