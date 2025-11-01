import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/health_service.dart';
import 'main_state.dart';

/// Cubit to manage the main screen state and logic
class MainCubit extends Cubit<MainState> {
  final HealthService _healthService;

  MainCubit(this._healthService) : super(MainInitial());

  /// Initialize the app by checking Health Connect status
  Future<void> initialize() async {
    emit(MainLoading());
    
    try {
      // Step 1: Check if Health Connect is installed
      final isInstalled = await _healthService.isHealthConnectInstalled();
      
      if (!isInstalled) {
        emit(HealthConnectNotInstalled());
        return;
      }

      // Step 2: Check if we already have permissions
      final hasPermissions = await _healthService.hasPermissions();
      
      if (!hasPermissions) {
        emit(PermissionsNotGranted());
        return;
      }

      // Step 3: Load sleep data
      await loadSleepData();
      
    } catch (e) {
      emit(MainError('Failed to initialize: ${e.toString()}'));
    }
  }

  /// Request permissions from the user
  Future<void> requestPermissions() async {
    emit(MainLoading());
    
    try {
      final granted = await _healthService.requestPermissions();
      
      if (granted) {
        // Permissions granted, load sleep data
        await loadSleepData();
      } else {
        emit(PermissionsDenied());
      }
    } catch (e) {
      emit(MainError('Failed to request permissions: ${e.toString()}'));
    }
  }

  /// Load sleep data for the last 7 days
  Future<void> loadSleepData() async {
    emit(MainLoading());
    
    try {
      final sleepData = await _healthService.getSleepData();
      emit(SleepDataLoaded(sleepData));
    } catch (e) {
      emit(MainError('Failed to load sleep data: ${e.toString()}'));
    }
  }

  /// Open Health Connect in Play Store
  Future<void> openHealthConnectInPlayStore() async {
    try {
      await _healthService.openHealthConnectInPlayStore();
    } catch (e) {
      emit(MainError('Failed to open Play Store: ${e.toString()}'));
    }
  }

  /// Open Health Connect app for permissions
  Future<void> openHealthConnectApp() async {
    try {
      await _healthService.openHealthConnectApp();
    } catch (e) {
      emit(MainError('Failed to open Health Connect: ${e.toString()}'));
    }
  }

  /// Retry the initialization process
  Future<void> retry() async {
    await initialize();
  }
}