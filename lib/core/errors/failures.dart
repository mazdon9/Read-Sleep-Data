import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base class for all application failures/exceptions
/// Uses freezed for immutable data classes and exhaustive pattern matching
@freezed
class Failure with _$Failure {
  /// Health Connect is not installed on the device
  const factory Failure.healthConnectNotInstalled({
    @Default('Health Connect is not installed') String message,
  }) = HealthConnectNotInstalledFailure;

  /// Health Connect is not supported on this device or Android version
  const factory Failure.healthConnectNotSupported({
    @Default('Health Connect is not supported on this device') String message,
  }) = HealthConnectNotSupportedFailure;

  /// User denied permission to access health data
  const factory Failure.permissionDenied({
    @Default('Permission to access health data was denied') String message,
  }) = PermissionDeniedFailure;

  /// Timeout occurred while waiting for permission response
  const factory Failure.permissionTimeout({
    @Default('Permission request timed out') String message,
  }) = PermissionTimeoutFailure;

  /// Error occurred while accessing health data
  const factory Failure.dataAccessError({
    @Default('Failed to access health data') String message,
    String? details,
  }) = DataAccessErrorFailure;

  /// No sleep data found for the requested period
  const factory Failure.noDataFound({
    @Default('No sleep data found') String message,
  }) = NoDataFoundFailure;

  /// Network connectivity or external service error
  const factory Failure.networkError({
    @Default('Network error occurred') String message,
    String? details,
  }) = NetworkErrorFailure;

  /// Generic unknown error for unexpected situations
  const factory Failure.unknown({
    @Default('An unknown error occurred') String message,
    String? details,
  }) = UnknownFailure;

  /// Invalid application state error
  const factory Failure.invalidState({
    @Default('Invalid application state') String message,
    String? details,
  }) = InvalidStateFailure;
}

/// Extension to provide user-friendly error messages
extension FailureExtensions on Failure {
  /// Returns a user-friendly error message that can be displayed in the UI
  String get userMessage {
    return when(
      healthConnectNotInstalled: (message) =>
          'Health Connect is required but not installed. Please install it from the Play Store.',
      healthConnectNotSupported: (message) =>
          'Health Connect is not supported on this device.',
      permissionDenied: (message) =>
          'Permission to access health data is required for this app to work.',
      permissionTimeout: (message) =>
          'Permission request timed out. Please try again.',
      dataAccessError: (message, details) =>
          'Unable to access health data. Please check your Health Connect settings.',
      noDataFound: (message) => 'No sleep data found for the last 7 days.',
      networkError: (message, details) =>
          'Network connection error. Please check your internet connection.',
      unknown: (message, details) =>
          'An unexpected error occurred. Please try again.',
      invalidState: (message, details) =>
          'The app is in an invalid state. Please restart the app.',
    );
  }

  /// Returns true if this failure should trigger a retry button
  bool get isRetryable {
    return when(
      healthConnectNotInstalled: (_) => false,
      healthConnectNotSupported: (_) => false,
      permissionDenied: (_) => true,
      permissionTimeout: (_) => true,
      dataAccessError: (_, __) => true,
      noDataFound: (_) => false,
      networkError: (_, __) => true,
      unknown: (_, __) => true,
      invalidState: (_, __) => true,
    );
  }

  /// Returns true if this failure should show an install button for Health Connect
  bool get shouldShowInstallButton {
    return when(
      healthConnectNotInstalled: (_) => true,
      healthConnectNotSupported: (_) => false,
      permissionDenied: (_) => false,
      permissionTimeout: (_) => false,
      dataAccessError: (_, __) => false,
      noDataFound: (_) => false,
      networkError: (_, __) => false,
      unknown: (_, __) => false,
      invalidState: (_, __) => false,
    );
  }
}
