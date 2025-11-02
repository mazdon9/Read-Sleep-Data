import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/health_service.dart';

/// Cubit for managing health data state and operations
/// Handles permission requests, data fetching, and error states
class HealthCubit extends Cubit<HealthState> {
  final HealthService _healthService;

  /// Constructor that takes required health service
  HealthCubit(this._healthService) : super(HealthState.initial);

  /// Check current Health Connect status
  Future<void> checkStatus() async {
    try {
      print('Debug: HealthCubit.checkStatus() called');
      emit(HealthState.loading);

      final isInstalled = await _healthService.isHealthConnectInstalled();
      print('Debug: Health Connect installed = $isInstalled');
      if (!isInstalled) {
        emit(HealthState.healthConnectNotInstalled);
        return;
      }

      // Always check permissions explicitly
      final hasPermission = await _healthService.hasPermissions();
      print('Debug: Has permissions = $hasPermission'); // Debug log

      if (hasPermission) {
        print('Debug: Permissions granted, loading sleep data...');
        await _loadSleepData();
      } else {
        print('Debug: Permissions not granted, showing permission required');
        emit(HealthState.permissionRequired);
      }
    } catch (error) {
      print('Debug: Error in checkStatus = $error'); // Debug log
      emit(HealthState.error('Failed to check Health Connect status'));
    }
  }

  /// Request permission to access health data
  Future<void> requestPermission() async {
    try {
      emit(HealthState.requestingPermission);

      final success = await _healthService.requestPermissions();
      if (success) {
        await _loadSleepData();
      } else {
        emit(HealthState.permissionDenied);
      }
    } catch (error) {
      emit(HealthState.error('Failed to request permission'));
    }
  }

  /// Load sleep data for the last 7 days
  Future<void> loadSleepData() async {
    await _loadSleepData();
  }

  /// Refresh sleep data (pull-to-refresh)
  Future<void> refreshSleepData() async {
    await _loadSleepData();
  }

  /// Open Health Connect app from Play Store
  Future<void> openHealthConnectInstall() async {
    try {
      final uri = Uri.parse(
        'https://play.google.com/store/apps/details?id=com.google.android.apps.healthdata',
      );
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        emit(HealthState.error('Cannot open Play Store'));
      }
    } catch (error) {
      emit(HealthState.error('Failed to open Play Store'));
    }
  }

  /// Private method to load sleep data
  Future<void> _loadSleepData() async {
    try {
      print('Debug: _loadSleepData() called');
      emit(HealthState.loadingData);

      final sleepData = await _healthService.getSleepData();
      print('Debug: Received ${sleepData.length} sleep data points');

      if (sleepData.isNotEmpty) {
        print('Debug: Emitting dataLoaded state');
        emit(HealthState.dataLoaded(sleepData));
      } else {
        print('Debug: No data found, emitting noData state');
        emit(HealthState.noData);
      }
    } catch (error) {
      print('Debug: Error in _loadSleepData = $error');
      emit(HealthState.error('Failed to load sleep data'));
    }
  }
}

/// States that the health screen can be in
/// Represents all possible states of the health data management flow
sealed class HealthState {
  const HealthState();

  /// Initial state when screen is first loaded
  static const HealthState initial = _InitialState();

  /// Loading state while checking status or requesting permissions
  static const HealthState loading = _LoadingState();

  /// Loading state specifically for data fetching
  static const HealthState loadingData = _LoadingDataState();

  /// Requesting permission from user
  static const HealthState requestingPermission = _RequestingPermissionState();

  /// Health Connect is not installed
  static const HealthState healthConnectNotInstalled =
      _HealthConnectNotInstalledState();

  /// Permission is required to access health data
  static const HealthState permissionRequired = _PermissionRequiredState();

  /// Permission was denied by the user
  static const HealthState permissionDenied = _PermissionDeniedState();

  /// No sleep data found
  static const HealthState noData = _NoDataState();

  /// Sleep data loaded successfully
  factory HealthState.dataLoaded(List<HealthDataPoint> sessions) =
      _DataLoadedState;

  /// An error occurred
  factory HealthState.error(String message) = _ErrorState;
}

/// Individual state implementations
class _InitialState extends HealthState {
  const _InitialState();
}

class _LoadingState extends HealthState {
  const _LoadingState();
}

class _LoadingDataState extends HealthState {
  const _LoadingDataState();
}

class _RequestingPermissionState extends HealthState {
  const _RequestingPermissionState();
}

class _HealthConnectNotInstalledState extends HealthState {
  const _HealthConnectNotInstalledState();
}

class _PermissionRequiredState extends HealthState {
  const _PermissionRequiredState();
}

class _PermissionDeniedState extends HealthState {
  const _PermissionDeniedState();
}

class _NoDataState extends HealthState {
  const _NoDataState();
}

class _DataLoadedState extends HealthState {
  final List<HealthDataPoint> sessions;

  const _DataLoadedState(this.sessions);
}

class _ErrorState extends HealthState {
  final String message;

  const _ErrorState(this.message);
}

/// Extension methods for HealthState to provide helper properties
extension HealthStateExtensions on HealthState {
  /// Check if state is loading
  bool get isLoading =>
      this is _LoadingState ||
      this is _LoadingDataState ||
      this is _RequestingPermissionState;

  /// Check if state has data
  bool get hasData => this is _DataLoadedState;

  /// Check if state is an error
  bool get isError => this is _ErrorState;

  /// Check if should show install button
  bool get shouldShowInstallButton => this is _HealthConnectNotInstalledState;

  /// Check if should show permission request
  bool get shouldShowPermissionRequest => this is _PermissionRequiredState;

  /// Check if should show retry button
  bool get shouldShowRetry =>
      this is _ErrorState || this is _PermissionDeniedState;

  /// Get error message if in error state
  String? get errorMessage =>
      this is _ErrorState ? (this as _ErrorState).message : null;

  /// Get sleep sessions if in data loaded state
  List<HealthDataPoint>? get sleepSessions =>
      this is _DataLoadedState ? (this as _DataLoadedState).sessions : null;
}
