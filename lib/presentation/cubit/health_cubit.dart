import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_constants.dart';
import '../../core/utils/logger.dart';
import '../../data/models/sleep_session_model.dart';
import '../../domain/usecases/check_health_connect_status.dart';
import '../../domain/usecases/get_sleep_data.dart';
import '../../domain/usecases/request_permission.dart';

/// Cubit for managing health data state and operations
/// Handles permission requests, data fetching, and error states
class HealthCubit extends Cubit<HealthState> {
  final RequestPermission _requestPermission;
  final GetSleepData _getSleepData;
  final CheckHealthConnectStatus _checkHealthConnectStatus;

  /// Constructor that takes required use case dependencies
  HealthCubit({
    required RequestPermission requestPermission,
    required GetSleepData getSleepData,
    required CheckHealthConnectStatus checkHealthConnectStatus,
  }) : _requestPermission = requestPermission,
       _getSleepData = getSleepData,
       _checkHealthConnectStatus = checkHealthConnectStatus,
       super(HealthState.initial);

  /// Check current Health Connect status
  Future<void> checkStatus() async {
    try {
      emit(HealthState.loading);

      final status = await _checkHealthConnectStatus();

      switch (status) {
        case HealthConnectStatus.notInstalled:
          emit(HealthState.healthConnectNotInstalled);
          break;
        case HealthConnectStatus.notSupported:
          emit(HealthState.healthConnectNotSupported);
          break;
        case HealthConnectStatus.availableNoPermission:
          emit(HealthState.permissionRequired);
          break;
        case HealthConnectStatus.availableWithPermission:
          await _loadSleepData();
          break;
        case HealthConnectStatus.error:
          emit(HealthState.error('Failed to check Health Connect status'));
          break;
      }
    } catch (error) {
      AppLogger.error(
        'Error checking Health Connect status',
        'HealthCubit',
        error,
      );
      emit(HealthState.error('An unexpected error occurred'));
    }
  }

  /// Request permission to access health data
  Future<void> requestPermission() async {
    try {
      emit(HealthState.requestingPermission);

      final result = await _requestPermission();

      switch (result) {
        case PermissionResult.granted:
        case PermissionResult.alreadyGranted:
          AppLogger.permission('Permission granted', 'Health Data');
          await _loadSleepData();
          break;
        case PermissionResult.denied:
          AppLogger.permission('Permission denied', 'Health Data');
          emit(HealthState.permissionDenied);
          break;
        case PermissionResult.healthConnectNotAvailable:
          emit(HealthState.healthConnectNotInstalled);
          break;
        case PermissionResult.error:
        case PermissionResult.timeout:
          emit(HealthState.error('Failed to request permission'));
          break;
      }
    } catch (error) {
      AppLogger.error('Error requesting permission', 'HealthCubit', error);
      emit(HealthState.error('An error occurred while requesting permission'));
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
      final uri = Uri.parse(HealthConnectConstants.healthConnectPlayStoreUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        emit(HealthState.error('Cannot open Play Store'));
      }
    } catch (error) {
      AppLogger.error(
        'Error opening Health Connect install',
        'HealthCubit',
        error,
      );
      emit(HealthState.error('Failed to open Play Store'));
    }
  }

  /// Private method to load sleep data
  Future<void> _loadSleepData() async {
    try {
      emit(HealthState.loadingData);

      final result = await _getSleepData();

      switch (result.status) {
        case SleepDataStatus.success:
          if (result.hasData) {
            final sleepModels = result.data!
                .map(
                  (session) => SleepSessionModel(
                    id: session.id,
                    startTime: session.startTime,
                    endTime: session.endTime,
                    source: session.source,
                  ),
                )
                .toList();

            AppLogger.health('Loaded ${sleepModels.length} sleep sessions');
            emit(HealthState.dataLoaded(sleepModels));
          } else {
            emit(HealthState.noData);
          }
          break;
        case SleepDataStatus.noData:
          emit(HealthState.noData);
          break;
        case SleepDataStatus.permissionDenied:
          emit(HealthState.permissionRequired);
          break;
        case SleepDataStatus.error:
          emit(HealthState.error('Failed to load sleep data'));
          break;
      }
    } catch (error) {
      AppLogger.error('Error loading sleep data', 'HealthCubit', error);
      emit(HealthState.error('An error occurred while loading sleep data'));
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

  /// Health Connect is not supported on this device
  static const HealthState healthConnectNotSupported =
      _HealthConnectNotSupportedState();

  /// Permission is required to access health data
  static const HealthState permissionRequired = _PermissionRequiredState();

  /// Permission was denied by the user
  static const HealthState permissionDenied = _PermissionDeniedState();

  /// No sleep data found
  static const HealthState noData = _NoDataState();

  /// Sleep data loaded successfully
  factory HealthState.dataLoaded(List<SleepSessionModel> sessions) =
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

class _HealthConnectNotSupportedState extends HealthState {
  const _HealthConnectNotSupportedState();
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
  final List<SleepSessionModel> sessions;

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
  List<SleepSessionModel>? get sleepSessions =>
      this is _DataLoadedState ? (this as _DataLoadedState).sessions : null;
}
