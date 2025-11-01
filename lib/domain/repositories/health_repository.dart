import 'package:health/health.dart';

import '../../core/errors/failures.dart';
import '../../core/utils/date_formatter.dart';
import '../entities/sleep_session.dart';

/// Repository interface for health data operations
/// Defines the contract for accessing health-related data and permissions
/// Implementations should handle platform-specific details
abstract class HealthRepository {
  /// Check if Health Connect is installed and available on the device
  /// Returns true if Health Connect is available, false otherwise
  /// Throws [Failure] if there's an error checking availability
  Future<bool> isHealthConnectAvailable();

  /// Check if the app has permission to read sleep data
  /// Returns true if permission is granted, false otherwise
  /// Throws [Failure] if there's an error checking permissions
  Future<bool> hasPermission();

  /// Request permission to access sleep data from the user
  /// Shows the system permission dialog
  /// Returns true if permission was granted, false if denied
  /// Throws [Failure] if there's an error requesting permission or timeout occurs
  Future<bool> requestPermission();

  /// Retrieve sleep sessions for the specified date range
  /// [dateRange] - The date range to fetch sleep data for
  /// Returns a list of sleep sessions found in the specified range
  /// Returns empty list if no data is found
  /// Throws [Failure] if there's an error accessing data or permission is denied
  Future<List<SleepSession>> getSleepData(DateTimeRange dateRange);

  /// Get the last 7 days of sleep data
  /// Convenience method that automatically calculates the date range
  /// Returns a list of sleep sessions from the last 7 days including today
  /// Throws [Failure] if there's an error accessing data or permission is denied
  Future<List<SleepSession>> getLastWeekSleepData() {
    final dateRange = DateTimeFormatter.getLastDaysRange(7);
    return getSleepData(dateRange);
  }

  /// Open Health Connect app for the user to manage settings
  /// Returns true if the app was successfully opened, false otherwise
  /// Throws [Failure] if there's an error opening the app
  Future<bool> openHealthConnectSettings();

  /// Get available health data types that can be accessed
  /// Returns a list of health data types available on this device
  /// Throws [Failure] if there's an error querying available types
  Future<List<HealthDataType>> getAvailableDataTypes();

  /// Check the current authorization status for specific health data types
  /// [types] - List of health data types to check status for
  /// Returns true if authorized, false otherwise
  /// Throws [Failure] if there's an error checking authorization status
  Future<bool> checkAuthorizationStatus(List<HealthDataType> types);
}
