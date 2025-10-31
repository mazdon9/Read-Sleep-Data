import 'package:health/health.dart';

import '../../core/utils/date_formatter.dart';
import '../../domain/entities/sleep_session.dart';
import '../../domain/repositories/health_repository.dart';
import '../datasources/health_data_source.dart';
import '../models/sleep_session_model.dart';

/// Implementation of HealthRepository that coordinates between domain and data layers
/// Handles error handling and data conversion between layers
class HealthRepositoryImpl implements HealthRepository {
  final HealthDataSource _dataSource;

  /// Constructor that takes a data source dependency
  const HealthRepositoryImpl({required HealthDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<bool> isHealthConnectAvailable() async {
    try {
      return await _dataSource.isHealthConnectAvailable();
    } catch (error) {
      // If any error occurs, assume Health Connect is not available
      return false;
    }
  }

  @override
  Future<bool> hasPermission() async {
    try {
      return await _dataSource.hasPermission();
    } catch (error) {
      // If any error occurs, assume no permission
      return false;
    }
  }

  @override
  Future<bool> requestPermission() async {
    try {
      return await _dataSource.requestPermission();
    } catch (error) {
      // If any error occurs during permission request, return false
      return false;
    }
  }

  @override
  Future<List<SleepSession>> getSleepData(DateTimeRange dateRange) async {
    try {
      // Get sleep data models from data source
      final sleepModels = await _dataSource.getSleepData(dateRange);

      // Convert models to domain entities
      final sleepSessions = sleepModels
          .map((model) => _convertToDomainEntity(model))
          .toList();

      return sleepSessions;
    } catch (error) {
      // If any error occurs, return empty list
      return [];
    }
  }

  @override
  Future<List<SleepSession>> getLastWeekSleepData() async {
    final dateRange = DateTimeFormatter.getLastDaysRange(7);
    return getSleepData(dateRange);
  }

  @override
  Future<bool> openHealthConnectSettings() async {
    try {
      return await _dataSource.openHealthConnectSettings();
    } catch (error) {
      return false;
    }
  }

  @override
  Future<List<HealthDataType>> getAvailableDataTypes() async {
    try {
      return await _dataSource.getAvailableDataTypes();
    } catch (error) {
      return [];
    }
  }

  @override
  Future<HealthConnectSdkStatus> checkAuthorizationStatus(
    List<HealthDataType> types,
  ) async {
    try {
      return await _dataSource.checkAuthorizationStatus(types);
    } catch (error) {
      // Return the first enum value on error (safer than hardcoding)
      return HealthConnectSdkStatus.values.first;
    }
  }

  /// Convert a SleepSessionModel to a domain SleepSession entity
  /// This method bridges the data and domain layers
  SleepSession _convertToDomainEntity(SleepSessionModel model) {
    // For now, create a simple sleep session since freezed isn't working
    // We'll improve this later when freezed code generation is working
    return SleepSession.simple(
      id: model.id,
      startTime: model.startTime,
      endTime: model.endTime,
      source: model.source,
    );
  }
}
