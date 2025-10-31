/// Application-wide string constants for consistent messaging and UI text
class AppStrings {
  /// App title and branding
  static const String appTitle = 'Sleep Data Tracker';

  /// Health Connect related messages
  static const String healthConnectRequired =
      'Health Connect is required to sync sleep data. Please install it.';
  static const String healthConnectInstallButton = 'Install';
  static const String healthConnectNotAvailable =
      'Health Connect is not available on this device.';

  /// Permission related messages
  static const String permissionDenied =
      'The app cannot display sleep data without permission.';
  static const String retryPermissionButton = 'Retry Permission';
  static const String requestingPermissions = 'Requesting permissions...';

  /// Data display messages
  static const String loadingSleepData = 'Loading sleep data...';
  static const String noDataAvailable = 'No Data';
  static const String sleepDataTitle = 'Sleep Data (Last 7 Days)';
  static const String errorLoadingData = 'Error loading sleep data';

  /// Generic messages
  static const String retry = 'Retry';
  static const String loading = 'Loading...';
  static const String error = 'Error';
  static const String ok = 'OK';

  /// Sleep data formatting
  static const String sleepDurationLabel = 'Duration';
  static const String sleepStartLabel = 'Sleep Start';
  static const String sleepEndLabel = 'Sleep End';
  static const String hoursAbbreviation = 'h';
  static const String minutesAbbreviation = 'm';
}
