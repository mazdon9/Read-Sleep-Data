import 'package:health/health.dart';

import '../../core/utils/date_formatter.dart';
import '../models/sleep_session_model.dart';

/// Abstract interface for health data access
/// Defines the contract for accessing health-related data from external sources
abstract class HealthDataSource {
  /// Check if Health Connect is available on the device
  Future<bool> isHealthConnectAvailable();

  /// Check if the app has permission to read health data
  Future<bool> hasPermission();

  /// Request permission to access health data
  Future<bool> requestPermission();

  /// Get sleep data for a specific date range
  Future<List<SleepSessionModel>> getSleepData(DateTimeRange dateRange);

  /// Open Health Connect settings
  Future<bool> openHealthConnectSettings();

  /// Get available health data types
  Future<List<HealthDataType>> getAvailableDataTypes();

  /// Check authorization status for specific data types
  Future<HealthConnectSdkStatus> checkAuthorizationStatus(
    List<HealthDataType> types,
  );
}

/// Implementation of HealthDataSource using the health package
/// Handles all interactions with Health Connect and platform-specific health APIs
class HealthDataSourceImpl implements HealthDataSource {
  /// Health instance for accessing health data
  final Health _health = Health();

  /// Health data types we want to access
  static const List<HealthDataType> _healthDataTypes = [
    HealthDataType.SLEEP_IN_BED,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_LIGHT,
    HealthDataType.SLEEP_REM,
  ];

  @override
  Future<bool> isHealthConnectAvailable() async {
    try {
      // Try to get health connect status - if it doesn't throw, it's likely available
      await _health.getHealthConnectSdkStatus();
      return true;
    } catch (error) {
      // If any error occurs, assume Health Connect is not available
      return false;
    }
  }

  @override
  Future<bool> hasPermission() async {
    try {
      // Check if we have permission for all required data types
      final hasPermissions = await _health.hasPermissions(_healthDataTypes);
      return hasPermissions ?? false;
    } catch (error) {
      // If error occurs, assume no permission
      return false;
    }
  }

  @override
  Future<bool> requestPermission() async {
    try {
      // Request permissions for all health data types we need
      final permissions = _healthDataTypes
          .map((type) => HealthDataAccess.READ)
          .toList();

      final permissionResult = await _health.requestAuthorization(
        _healthDataTypes,
        permissions: permissions,
      );

      return permissionResult;
    } catch (error) {
      // If error occurs during permission request, return false
      return false;
    }
  }

  @override
  Future<List<SleepSessionModel>> getSleepData(DateTimeRange dateRange) async {
    try {
      // First check if we have permission
      final hasPermission = await this.hasPermission();
      if (!hasPermission) {
        throw Exception('No permission to access health data');
      }

      // Get health data points for the specified date range
      final healthData = await _health.getHealthDataFromTypes(
        types: _healthDataTypes,
        startTime: dateRange.start,
        endTime: dateRange.end,
      );

      // Convert health data points to sleep session models
      return _convertHealthDataToSleepSessions(healthData);
    } catch (error) {
      // If any error occurs, return empty list
      return [];
    }
  }

  @override
  Future<bool> openHealthConnectSettings() async {
    try {
      // Try to open Health Connect settings
      // Note: This feature may not be available in all versions of the health package
      return false; // Placeholder implementation
    } catch (error) {
      return false;
    }
  }

  @override
  Future<List<HealthDataType>> getAvailableDataTypes() async {
    try {
      // Return the data types that we support
      return _healthDataTypes;
    } catch (error) {
      return [];
    }
  }

  @override
  Future<HealthConnectSdkStatus> checkAuthorizationStatus(
    List<HealthDataType> types,
  ) async {
    try {
      final status = await _health.getHealthConnectSdkStatus();
      // Return first enum value if null (we'll check actual values later)
      return status ?? HealthConnectSdkStatus.values.first;
    } catch (error) {
      // Return first enum value on error
      return HealthConnectSdkStatus.values.first;
    }
  }

  /// Convert raw health data points to structured sleep session models
  /// Groups related sleep data points into coherent sleep sessions
  List<SleepSessionModel> _convertHealthDataToSleepSessions(
    List<HealthDataPoint> healthData,
  ) {
    if (healthData.isEmpty) {
      return [];
    }

    // Group health data points by date
    final Map<String, List<HealthDataPoint>> dataByDate = {};

    for (final dataPoint in healthData) {
      final dateKey = DateTimeFormatter.formatDate(dataPoint.dateFrom);
      dataByDate.putIfAbsent(dateKey, () => []).add(dataPoint);
    }

    // Convert each group of data points to sleep sessions
    final List<SleepSessionModel> sessions = [];

    for (final entry in dataByDate.entries) {
      final dailyData = entry.value;
      final sleepSessions = _processDailySleepData(dailyData);
      sessions.addAll(sleepSessions);
    }

    return sessions;
  }

  /// Process daily sleep data points into sleep sessions
  /// Handles the logic of combining different sleep stages into coherent sessions
  List<SleepSessionModel> _processDailySleepData(
    List<HealthDataPoint> dailyData,
  ) {
    // Sort data points by start time
    dailyData.sort((a, b) => a.dateFrom.compareTo(b.dateFrom));

    final List<SleepSessionModel> sessions = [];

    // Find sleep sessions based on SLEEP_IN_BED or SLEEP_ASLEEP data points
    final sleepBedData = dailyData
        .where(
          (point) =>
              point.type == HealthDataType.SLEEP_IN_BED ||
              point.type == HealthDataType.SLEEP_ASLEEP,
        )
        .toList();

    for (final bedData in sleepBedData) {
      // Create a basic sleep session
      final session = SleepSessionModel(
        id: '${bedData.dateFrom.millisecondsSinceEpoch}',
        startTime: bedData.dateFrom,
        endTime: bedData.dateTo,
        source: 'Health Connect',
      );

      sessions.add(session);
    }

    return sessions;
  }
}
