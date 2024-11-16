import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

abstract class LocalStorageService {
  const LocalStorageService();

  Future<void> initDB();

  Future<void> savePreference({required String key, required String data});

  String? getPreference({required String key});

  Future<void> deletePreference({required String key});
}

class LocalStorageServiceImpl implements LocalStorageService {
  LocalStorageServiceImpl();

  late Box<String> _box;

  @override
  Future<void> initDB() async {
    _box = await Hive.openBox('card_box_0');
  }

  @override
  String? getPreference({required String key}) {
    return _box.get(key);
  }

  @override
  Future<void> savePreference({
    required String key,
    required String data,
  }) async {
    await _box.put(key, data);
  }

  @override
  Future<void> deletePreference({required String key}) async {
    try {
      await _box.delete(key);
    } catch (e) {
      Logger().e(e);
    }
  }
}
