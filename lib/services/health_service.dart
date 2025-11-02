import 'package:health/health.dart';
import 'package:url_launcher/url_launcher.dart';

/// Service to handle all Health Connect operations
class HealthService {
  static final HealthService _instance = HealthService._internal();
  factory HealthService() => _instance;
  HealthService._internal();

  final Health _health = Health();

  /// Sleep data types we want to access
  static const List<HealthDataType> _sleepDataTypes = [
    HealthDataType.SLEEP_SESSION,
    // HealthDataType.SLEEP_ASLEEP,
    // HealthDataType.SLEEP_AWAKE,
    // HealthDataType.SLEEP_DEEP,
    // HealthDataType.SLEEP_LIGHT,
    // HealthDataType.SLEEP_REM,
    // HealthDataType.SLEEP_IN_BED,
  ];

  /// Configure health plugin
  Future<void> configure() async {
    await _health.configure();
  }

  /// Check if Health Connect is installed on the device
  Future<bool> isHealthConnectInstalled() async {
    try {
      await configure();
      // If configure doesn't throw, Health Connect is likely available
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Check if app has permission to read sleep data
  Future<bool> hasPermissions() async {
    try {
      print('Debug: Starting permission check...');
      await configure();

      // Check each data type individually for more accurate permission checking
      for (final dataType in _sleepDataTypes) {
        final hasPermission = await _health.hasPermissions([dataType]);
        print('Debug: Permission for $dataType = $hasPermission');
        if (hasPermission != true) {
          print('Debug: Missing permission for $dataType, returning false');
          return false;
        }
      }

      print('Debug: All permissions granted!');
      return true;
    } catch (e) {
      print('Debug: Error checking permissions: $e');
      return false;
    }
  }

  /// Request permissions to read sleep data
  Future<bool> requestPermissions() async {
    try {
      await configure();

      // Request READ permissions for all sleep data types
      final permissions = _sleepDataTypes
          .map((type) => HealthDataAccess.READ)
          .toList();

      final granted = await _health.requestAuthorization(
        _sleepDataTypes,
        permissions: permissions,
      );

      return granted;
    } catch (e) {
      print('Error requesting permissions: $e');
      return false;
    }
  }

  /// Get sleep data for the last 7 days
  Future<List<HealthDataPoint>> getSleepData() async {
    try {
      print('Debug: Starting to get sleep data...');
      await configure();

      final now = DateTime.now();
      final sevenDaysAgo = now.subtract(const Duration(days: 7));

      print('Debug: Fetching data from $sevenDaysAgo to $now');

      final healthData = await _health.getHealthDataFromTypes(
        types: _sleepDataTypes,
        startTime: sevenDaysAgo,
        endTime: now,
      );

      print('Debug: Raw health data count: ${healthData.length}');

      // Remove duplicates
      final uniqueData = _health.removeDuplicates(healthData);
      print('Debug: Unique data count: ${uniqueData.length}');

      // Sort by date (newest first)
      uniqueData.sort((a, b) => b.dateFrom.compareTo(a.dateFrom));

      // Print sample data for debugging
      if (uniqueData.isNotEmpty) {
        print('Debug: Sample data:');
        for (int i = 0; i < uniqueData.length && i < 3; i++) {
          final data = uniqueData[i];
          print(
            '  - Type: ${data.type}, From: ${data.dateFrom}, To: ${data.dateTo}, Value: ${data.value}, Source: ${data.sourceName}',
          );
        }
      } else {
        print('Debug: No sleep data found');
      }

      return uniqueData;
    } catch (e) {
      print('Debug: Error getting sleep data: $e');
      return [];
    }
  }

  /// Open Health Connect app in Google Play Store
  Future<void> openHealthConnectInPlayStore() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.google.android.apps.healthdata';

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Open Health Connect app for permissions
  Future<void> openHealthConnectApp() async {
    try {
      // Try to open Health Connect app directly
      const packageName = 'com.google.android.apps.healthdata';
      final uri = Uri.parse('market://details?id=$packageName');

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        // Fallback to web Play Store
        await openHealthConnectInPlayStore();
      }
    } catch (e) {
      // Fallback to web Play Store
      await openHealthConnectInPlayStore();
    }
  }
}
