class ServerException implements Exception {
  const ServerException({this.trace, this.message});

  final StackTrace? trace;
  final String? message;
}

class CacheException implements Exception {
  const CacheException({this.message});

  final String? message;
}
