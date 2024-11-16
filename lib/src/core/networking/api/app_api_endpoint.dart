import 'package:test_project/src/core/constants/app_env.dart';

/// All the endpoint used in this project are to be declared
/// in this class.
///
/// Example
///
/// static Uri authUrl =
///  Uri(scheme: 'https', host: 'oxygen.com', path: '/api/v1/auth')
class AppApiEndpoint {
  const AppApiEndpoint._();

  static const scheme = 'https';
  static String host = AppEnv.apiBaseURL;
  static const int receiveTimeout = 50000;
  static const int sendTimeout = 50000;

  static String baseUri = '$scheme://$host//';
}
