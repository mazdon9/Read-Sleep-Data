import 'package:health/health.dart';

/// States for the main screen
abstract class MainState {}

/// Initial state
class MainInitial extends MainState {}

/// Loading state
class MainLoading extends MainState {}

/// Health Connect not installed
class HealthConnectNotInstalled extends MainState {}

/// Permissions not granted
class PermissionsNotGranted extends MainState {}

/// Permissions denied by user
class PermissionsDenied extends MainState {}

/// Successfully loaded sleep data
class SleepDataLoaded extends MainState {
  final List<HealthDataPoint> sleepData;
  
  SleepDataLoaded(this.sleepData);
}

/// Error occurred
class MainError extends MainState {
  final String message;
  
  MainError(this.message);
}