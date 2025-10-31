import '../repositories/health_repository.dart';

/// Use case for checking Health Connect installation and availability status
/// Encapsulates the business logic for determining if Health Connect can be used
class CheckHealthConnectStatus {
  final HealthRepository _repository;

  /// Constructor that takes a repository dependency
  const CheckHealthConnectStatus({required HealthRepository repository})
    : _repository = repository;

  /// Execute the use case to check Health Connect status
  /// Returns [HealthConnectStatus] indicating the current state
  /// Never throws exceptions - all errors are captured in the status
  Future<HealthConnectStatus> call() async {
    try {
      // First check if Health Connect is available on the device
      final isAvailable = await _repository.isHealthConnectAvailable();

      if (!isAvailable) {
        return HealthConnectStatus.notInstalled;
      }

      // If available, check if we have permission
      final hasPermission = await _repository.hasPermission();

      if (hasPermission) {
        return HealthConnectStatus.availableWithPermission;
      } else {
        return HealthConnectStatus.availableNoPermission;
      }
    } catch (error) {
      // Handle any errors
      return HealthConnectStatus.error;
    }
  }
}

/// Status of Health Connect availability and permissions
/// Used to represent the current state in a type-safe way
enum HealthConnectStatus {
  /// Health Connect is not installed on the device
  notInstalled,

  /// Health Connect is not supported on this device/OS version
  notSupported,

  /// Health Connect is available but we don't have permission
  availableNoPermission,

  /// Health Connect is available and we have permission
  availableWithPermission,

  /// An error occurred while checking status
  error;

  /// Human-readable message describing the status
  String get message {
    switch (this) {
      case HealthConnectStatus.notInstalled:
        return 'Health Connect is not installed';
      case HealthConnectStatus.notSupported:
        return 'Health Connect is not supported on this device';
      case HealthConnectStatus.availableNoPermission:
        return 'Health Connect is available but permission is needed';
      case HealthConnectStatus.availableWithPermission:
        return 'Health Connect is available with permission';
      case HealthConnectStatus.error:
        return 'An error occurred while checking Health Connect status';
    }
  }

  /// Check if Health Connect is available for use (installed and supported)
  bool get isAvailable =>
      this == availableNoPermission || this == availableWithPermission;

  /// Check if we have permission to access health data
  bool get hasPermission => this == availableWithPermission;

  /// Check if we need to request permission
  bool get needsPermission => this == availableNoPermission;

  /// Check if we need to install Health Connect
  bool get needsInstallation => this == notInstalled;

  /// Check if there was an error
  bool get hasError => this == error;

  /// Check if Health Connect is not supported
  bool get isNotSupported => this == notSupported;
}
