import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_project/src/core/mixins/base_model.dart';
import 'package:test_project/src/services/database_service.dart';

class MockDatabase extends Mock implements Database {}

class MockModel extends Mock implements BaseModel<MockModel> {}

void main() {
  late MockDatabase mockDatabase;
  late DatabaseService<MockModel> databaseService;
  const tableName = 'test_table';

  setUp(() {
    mockDatabase = MockDatabase();
    databaseService = DatabaseServiceImpl<MockModel>(
      tableName: tableName,
      testDatabase: mockDatabase, // Inject mock database
      databaseName: 'db.db',
    );
  });

  group('database service ...', () {
    test('Insert should return valid id', () async {
      final mockModel = MockModel();
      when(mockModel.toJson).thenReturn({'name': 'John', 'age': 30});
      when(
        () => mockDatabase.insert(
          any(),
          any(),
          conflictAlgorithm: any(named: 'conflictAlgorithm'),
        ),
      ).thenAnswer((_) async => 1);

      final result = await databaseService.insert(mockModel);
      expect(result, 1);
    });

    test('Update should return the number of affected rows', () async {
      final mockModel = MockModel();
      when(mockModel.toJson).thenReturn({'name': 'John', 'age': 35});
      when(
        () => mockDatabase.update(
          any(),
          any(),
          where: any(named: 'where'),
          whereArgs: any(named: 'whereArgs'),
        ),
      ).thenAnswer((_) async => 1);

      final result = await databaseService.update(mockModel, 1);
      expect(result, 1);
    });

    test('Delete should return the number of affected rows', () async {
      when(
        () => mockDatabase.delete(
          any(),
          where: any(named: 'where'),
          whereArgs: any(named: 'whereArgs'),
        ),
      ).thenAnswer((_) async => 1);

      final result = await databaseService.delete(1);
      expect(result, 1);
    });

    test('DeleteAll should return the number of affected rows', () async {
      when(() => mockDatabase.delete(any())).thenAnswer((_) async => 2);

      final result = await databaseService.deleteAll();
      expect(result, 2);
    });
  });
}
