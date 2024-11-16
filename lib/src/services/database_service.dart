import 'package:sqflite/sqflite.dart';
import 'package:test_project/src/core/error/exceptions.dart';
import 'package:test_project/src/core/mixins/base_model.dart';

abstract class DatabaseService<T> {
  Future<int> insert(T item);
  Future<Map<String, dynamic>?> getById(int id);
  Future<List<Map<String, dynamic>>> getAll();
  Future<int> update(T item, int id);
  Future<int> delete(int id);
  Future<int> deleteAll();
}

class DatabaseServiceImpl<T extends BaseModel<T>>
    implements DatabaseService<T> {
  DatabaseServiceImpl({
    required this.tableName,
    required this.databaseName,
    Database? testDatabase, // Optional parameter for testing
  }) : _testDatabase = testDatabase;

  static Database? _database;

  final String tableName;
  final String databaseName;
  final Database? _testDatabase;

  Future<Database> get database async {
    if (_testDatabase != null) {
      return _testDatabase; // Return mock database for testing
    }
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = '$dbPath$databaseName';

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
           CREATE TABLE IF NOT EXISTS order_table (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              table_id INTEGER NOT NULL, 
              created_at TEXT NOT NULL,
              updated_at TEXT NOT NULL,
              status TEXT NOT NULL,
              total_price REAL NOT NULL,
              paid_amount REAL NOT NULL
          )
        ''');
        await db.execute('''
           CREATE TABLE IF NOT EXISTS sitting_table (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              order_item_id TEXT NOT NULL,
              name TEXT NOT NULL,
              item_count INTEGER NOT NULL,
              created_at TEXT NOT NULL,
              updated_at TEXT NOT NULL
          )
        ''');
        await db.execute('''
           CREATE TABLE IF NOT EXISTS menu_item (
               id INTEGER PRIMARY KEY AUTOINCREMENT,
                category_id INTEGER NOT NULL,
                name TEXT NOT NULL,
                image TEXT NOT NULL,
                price REAL NOT NULL
          )
        ''');
        await db.execute('''
           CREATE TABLE IF NOT EXISTS category (
               id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL,
                items TEXT NOT NULL
          )
        ''');
      },
    ).onError((error, _) {
      throw const CacheException(message: 'Error opening database');
    });
  }

  @override
  Future<int> insert(T item) async {
    try {
      final db = await database;
      return db.insert(
        tableName,
        item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw const CacheException(message: 'Error inserting data to database');
    }
  }

  @override
  Future<Map<String, dynamic>?> getById(int id) async {
    try {
      final db = await database;
      final results = await db.query(
        tableName,
        where: 'id = ?',
        whereArgs: [id],
        limit: 1,
      );
      return results.isNotEmpty ? results.first : null;
    } catch (e) {
      throw CacheException(
        message: 'Data with id=$id not found in database',
      );
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    try {
      final db = await database;
      return await db.query(tableName);
    } catch (e) {
      throw const CacheException(message: 'Error getting data from database');
    }
  }

  @override
  Future<int> update(T item, int id) async {
    try {
      final db = await database;
      return db.update(
        tableName,
        item.toJson(),
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw CacheException(
        message: 'Error updating data with id=$id in database',
      );
    }
  }

  @override
  Future<int> delete(int id) async {
    try {
      final db = await database;
      return db.delete(
        tableName,
        // where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw CacheException(
        message: 'Error deleting data with id=$id from database',
      );
    }
  }

  @override
  Future<int> deleteAll() async {
    try {
      final db = await database;
      return db.delete(tableName);
    } catch (e) {
      throw const CacheException(
        message: 'Error deleting all data from database',
      );
    }
  }
}
