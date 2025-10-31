import '../repositories/health_repository.dart';

/// Use case for requesting permission to access health data
/// Encapsulates the business logic for permission management
class RequestPermission {
  final HealthRepository _repository;

  /// Constructor that takes a repository dependency
  const RequestPermission({required HealthRepository repository})
    : _repository = repository;

  /// Execute the use case to request permission
  /// Returns [PermissionResult] indicating the outcome of the permission request
  /// Never throws exceptions - all errors are captured in the result
  Future<PermissionResult> call() async {
    try {
      // First check if Health Connect is available
      final isAvailable = await _repository.isHealthConnectAvailable();
      if (!isAvailable) {
        return PermissionResult.healthConnectNotAvailable;
      }

      // Check if we already have permission
      final alreadyHasPermission = await _repository.hasPermission();
      if (alreadyHasPermission) {
        return PermissionResult.alreadyGranted;
      }

      // Request permission from the user
      final permissionGranted = await _repository.requestPermission();

      if (permissionGranted) {
        return PermissionResult.granted;
      } else {
        return PermissionResult.denied;
      }
    } catch (error) {
      // Handle any errors that occurred during permission request
      return PermissionResult.error;
    }
  }

  /// Check current permission status without requesting
  /// Returns true if permission is already granted, false otherwise
  Future<bool> checkCurrentPermission() async {
    try {
      return await _repository.hasPermission();
    } catch (error) {
      return false;
    }
  }
}

/// Result of a permission request operation
/// Represents all possible outcomes of requesting health data permission
enum PermissionResult {
  /// Permission was successfully granted by the user
  granted,

  /// Permission was denied by the user
  denied,

  /// Permission was already granted (no need to request again)
  alreadyGranted,

  /// Health Connect is not available on the device
  healthConnectNotAvailable,

  /// An error occurred during the permission request
  error,

  /// The permission request timed out
  timeout;

  /// Human-readable message describing the result
  String get message {
    switch (this) {
      case PermissionResult.granted:
        return 'Permission granted successfully';
      case PermissionResult.denied:
        return 'Permission was denied by the user';
      case PermissionResult.alreadyGranted:
        return 'Permission was already granted';
      case PermissionResult.healthConnectNotAvailable:
        return 'Health Connect is not available on this device';
      case PermissionResult.error:
        return 'An error occurred while requesting permission';
      case PermissionResult.timeout:
        return 'Permission request timed out';
    }
  }

  /// Check if the permission request was successful
  bool get isSuccessful => this == granted || this == alreadyGranted;

  /// Check if permission was denied
  bool get wasDenied => this == denied;

  /// Check if there was an error
  bool get hasError => this == error || this == timeout;

  /// Check if we should show retry option
  bool get canRetry => this == denied || this == error || this == timeout;

  /// Check if we should show install Health Connect option
  bool get shouldInstallHealthConnect => this == healthConnectNotAvailable;
}
