import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/check_health_connect_status.dart';

/// Cubit for managing splash screen state and initial app setup
/// Handles the logic for checking Health Connect status during app startup
class SplashCubit extends Cubit<SplashState> {
  final CheckHealthConnectStatus _checkHealthConnectStatus;

  /// Constructor that takes required use case dependencies
  SplashCubit({required CheckHealthConnectStatus checkHealthConnectStatus})
    : _checkHealthConnectStatus = checkHealthConnectStatus,
      super(SplashState.loading);

  /// Initialize the app by checking Health Connect status
  /// This is called when the splash screen is displayed
  Future<void> initialize() async {
    try {
      // Small delay to show splash screen (improve user experience)
      await Future.delayed(const Duration(seconds: 2));

      // Check Health Connect availability and permissions
      final status = await _checkHealthConnectStatus();

      // Emit the appropriate state based on Health Connect status
      switch (status) {
        case HealthConnectStatus.notInstalled:
          emit(SplashState.healthConnectNotInstalled);
          break;
        case HealthConnectStatus.notSupported:
          emit(SplashState.healthConnectNotSupported);
          break;
        case HealthConnectStatus.availableNoPermission:
          emit(SplashState.needsPermission);
          break;
        case HealthConnectStatus.availableWithPermission:
          emit(SplashState.ready);
          break;
        case HealthConnectStatus.error:
          emit(SplashState.error);
          break;
      }
    } catch (error) {
      // Handle any unexpected errors during initialization
      emit(SplashState.error);
    }
  }

  /// Retry initialization (useful when user fixes issues and comes back)
  Future<void> retry() async {
    emit(SplashState.loading);
    await initialize();
  }
}

/// States that the splash screen can be in
/// Each state represents a different outcome of the Health Connect check
enum SplashState {
  /// App is starting up and checking Health Connect status
  loading,

  /// Health Connect is not installed on the device
  healthConnectNotInstalled,

  /// Health Connect is not supported on this device
  healthConnectNotSupported,

  /// Health Connect is available but permission is needed
  needsPermission,

  /// Everything is ready, can proceed to main app
  ready,

  /// An error occurred during initialization
  error;

  /// Human-readable message for each state
  String get message {
    switch (this) {
      case SplashState.loading:
        return 'Initializing...';
      case SplashState.healthConnectNotInstalled:
        return 'Health Connect is required but not installed. Please install it from the Play Store.';
      case SplashState.healthConnectNotSupported:
        return 'Health Connect is not supported on this device.';
      case SplashState.needsPermission:
        return 'Permission to access health data is required.';
      case SplashState.ready:
        return 'Ready to access sleep data!';
      case SplashState.error:
        return 'An error occurred during initialization. Please try again.';
    }
  }

  /// Check if this state should show a loading indicator
  bool get isLoading => this == loading;

  /// Check if this state should show an error message
  bool get isError => this == error;

  /// Check if this state should show the install Health Connect button
  bool get shouldShowInstallButton => this == healthConnectNotInstalled;

  /// Check if this state should navigate to the permission request
  bool get shouldRequestPermission => this == needsPermission;

  /// Check if this state should navigate to the main app
  bool get shouldNavigateToHome => this == ready;

  /// Check if this state should show a retry button
  bool get shouldShowRetryButton =>
      this == error || this == healthConnectNotSupported;
}
