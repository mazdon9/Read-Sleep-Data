/// Health Connect package URL constants
class HealthConnectConstants {
  /// Google Play Store URL for Health Connect app
  static const String healthConnectPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.google.android.apps.healthdata';

  /// Package name for Health Connect
  static const String healthConnectPackageName =
      'com.google.android.apps.healthdata';

  /// Minimum supported Android API level for Health Connect
  static const int minSupportedApiLevel = 26;

  /// Maximum number of days to fetch sleep data
  static const int maxDataDays = 7;

  /// Health data types we're interested in
  static const String sleepDataType = 'SLEEP';

  /// Permission request codes
  static const int permissionRequestCode = 1001;
}

/// Route name constants for navigation
class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String settings = '/settings';
  static const String about = '/about';
}

/// Error code constants for consistent error handling
class ErrorCodes {
  /// Health Connect related errors
  static const String healthConnectNotInstalled =
      'HEALTH_CONNECT_NOT_INSTALLED';
  static const String healthConnectNotSupported =
      'HEALTH_CONNECT_NOT_SUPPORTED';
  static const String permissionDenied = 'PERMISSION_DENIED';
  static const String permissionTimeout = 'PERMISSION_TIMEOUT';

  /// Data access errors
  static const String dataAccessError = 'DATA_ACCESS_ERROR';
  static const String noDataFound = 'NO_DATA_FOUND';
  static const String networkError = 'NETWORK_ERROR';

  /// Generic errors
  static const String unknownError = 'UNKNOWN_ERROR';
  static const String invalidState = 'INVALID_STATE';
}
