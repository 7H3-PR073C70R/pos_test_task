import 'package:test_project/src/services/local_storage_service.dart';

abstract class UserStorageService {
  void saveToken(String token);

  String? getToken();

  void clearStorage();
}

class UserStorageServiceImpl implements UserStorageService {
  UserStorageServiceImpl(this._localStorageService);
  final LocalStorageService _localStorageService;

  final _tokenKey = '__token';

  @override
  String? getToken() {
    try {
      return _localStorageService.getPreference(key: _tokenKey);
    } catch (e) {
      return null;
    }
  }

  @override
  void saveToken(String token) {
    try {
      _localStorageService.savePreference(key: _tokenKey, data: token);
    } catch (e) {
      return;
    }
  }

  @override
  void clearStorage() {}
}
