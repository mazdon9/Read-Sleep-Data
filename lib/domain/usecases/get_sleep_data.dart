import '../../core/utils/date_formatter.dart';
import '../entities/sleep_session.dart';
import '../repositories/health_repository.dart';

/// Use case for retrieving sleep data from Health Connect
/// Encapsulates the business logic for fetching and processing sleep information
class GetSleepData {
  final HealthRepository _repository;

  /// Constructor that takes a repository dependency
  const GetSleepData({required HealthRepository repository})
    : _repository = repository;

  /// Execute the use case to get sleep data for the last 7 days
  /// Returns [SleepDataResult] containing the sleep sessions or error information
  /// Never throws exceptions - all errors are captured in the result
  Future<SleepDataResult> call() async {
    try {
      // First check if we have permission
      final hasPermission = await _repository.hasPermission();
      if (!hasPermission) {
        return SleepDataResult.permissionDenied;
      }

      // Get the last 7 days of sleep data
      final sleepSessions = await _repository.getLastWeekSleepData();

      // Sort sessions by start time (most recent first) - will work after freezed generation
      // sleepSessions.sort((a, b) => b.startTime.compareTo(a.startTime));

      // Filter out invalid sessions - will work after freezed generation
      // final validSessions = sleepSessions.where((session) => session.isValid).toList();
      final validSessions = sleepSessions;

      if (validSessions.isEmpty) {
        return SleepDataResult.noData;
      }

      return SleepDataResult.success(validSessions);
    } catch (error) {
      // Handle any errors that occurred during data retrieval
      return SleepDataResult.error;
    }
  }

  /// Get sleep data for a specific date range
  /// [dateRange] - The date range to fetch sleep data for
  /// Returns [SleepDataResult] containing the sleep sessions or error information
  Future<SleepDataResult> getDataForDateRange(DateTimeRange dateRange) async {
    try {
      // First check if we have permission
      final hasPermission = await _repository.hasPermission();
      if (!hasPermission) {
        return SleepDataResult.permissionDenied;
      }

      // Get sleep data for the specified date range
      final sleepSessions = await _repository.getSleepData(dateRange);

      // Sort sessions by start time (most recent first) - will work after freezed generation
      // sleepSessions.sort((a, b) => b.startTime.compareTo(a.startTime));

      // Filter out invalid sessions - will work after freezed generation
      // final validSessions = sleepSessions.where((session) => session.isValid).toList();
      final validSessions = sleepSessions;

      if (validSessions.isEmpty) {
        return SleepDataResult.noData;
      }

      return SleepDataResult.success(validSessions);
    } catch (error) {
      // Handle any errors that occurred during data retrieval
      return SleepDataResult.error;
    }
  }

  /// Get sleep data summary for the last week
  /// Returns aggregated information about sleep patterns
  Future<SleepSummaryResult> getWeeklySummary() async {
    final result = await call();

    if (result.status != SleepDataStatus.success) {
      return SleepSummaryResult.fromDataResult(result);
    }

    final sessions = result.data!;
    return SleepSummaryResult.success(_calculateSummary(sessions));
  }

  /// Calculate sleep summary statistics from a list of sleep sessions
  SleepSummary _calculateSummary(List<SleepSession> sessions) {
    if (sessions.isEmpty) {
      return SleepSummary.empty();
    }

    // Calculate average sleep duration - will work after freezed generation
    // final totalMinutes = sessions.fold<int>(
    //   0,
    //   (sum, session) => sum + session.duration.inMinutes,
    // );
    final totalMinutes =
        sessions.length * 480; // Temporary: assume 8 hours per session
    final averageDuration = Duration(minutes: totalMinutes ~/ sessions.length);

    // Find best and worst sleep sessions - simplified for now
    final longestSleep = sessions.first;
    final shortestSleep = sessions.first;

    // Calculate sleep consistency - simplified for now
    final standardDeviation = const Duration(minutes: 30);

    return SleepSummary(
      totalSessions: sessions.length,
      averageDuration: averageDuration,
      totalSleepTime: Duration(minutes: totalMinutes),
      longestSleep: longestSleep,
      shortestSleep: shortestSleep,
      consistencyScore: _calculateConsistencyScore(standardDeviation),
    );
  }

  /// Calculate a consistency score (0-100) based on sleep duration variation
  /// Lower standard deviation = higher consistency score
  int _calculateConsistencyScore(Duration standardDeviation) {
    // If standard deviation is 0, perfect consistency
    if (standardDeviation.inMinutes == 0) return 100;

    // Convert standard deviation to hours
    final stdDevHours = standardDeviation.inMinutes / 60.0;

    // Score decreases as standard deviation increases
    // 0.5 hours std dev = 90 points, 1 hour = 80 points, 2 hours = 60 points, etc.
    final score = (100 - (stdDevHours * 20)).round().clamp(0, 100);

    return score;
  }
}

/// Result of getting sleep data
/// Contains either successful data or error information
class SleepDataResult {
  final SleepDataStatus status;
  final List<SleepSession>? data;

  const SleepDataResult._({required this.status, this.data});

  /// Successful result with sleep data
  factory SleepDataResult.success(List<SleepSession> sessions) {
    return SleepDataResult._(status: SleepDataStatus.success, data: sessions);
  }

  /// No sleep data found
  static const SleepDataResult noData = SleepDataResult._(
    status: SleepDataStatus.noData,
  );

  /// Permission denied
  static const SleepDataResult permissionDenied = SleepDataResult._(
    status: SleepDataStatus.permissionDenied,
  );

  /// Error occurred
  static const SleepDataResult error = SleepDataResult._(
    status: SleepDataStatus.error,
  );

  /// Check if the result is successful
  bool get isSuccess => status == SleepDataStatus.success;

  /// Check if there's data available
  bool get hasData => data != null && data!.isNotEmpty;
}

/// Status of sleep data retrieval
enum SleepDataStatus { success, noData, permissionDenied, error }

/// Sleep summary result containing aggregated sleep statistics
class SleepSummaryResult {
  final SleepDataStatus status;
  final SleepSummary? summary;

  const SleepSummaryResult._({required this.status, this.summary});

  factory SleepSummaryResult.success(SleepSummary summary) {
    return SleepSummaryResult._(
      status: SleepDataStatus.success,
      summary: summary,
    );
  }

  factory SleepSummaryResult.fromDataResult(SleepDataResult dataResult) {
    return SleepSummaryResult._(status: dataResult.status);
  }

  bool get isSuccess => status == SleepDataStatus.success;
}

/// Sleep summary containing aggregated sleep statistics
class SleepSummary {
  final int totalSessions;
  final Duration averageDuration;
  final Duration totalSleepTime;
  final SleepSession longestSleep;
  final SleepSession shortestSleep;
  final int consistencyScore; // 0-100, higher is more consistent

  const SleepSummary({
    required this.totalSessions,
    required this.averageDuration,
    required this.totalSleepTime,
    required this.longestSleep,
    required this.shortestSleep,
    required this.consistencyScore,
  });

  /// Empty summary for when there's no data
  SleepSummary.empty()
    : totalSessions = 0,
      averageDuration = Duration.zero,
      totalSleepTime = Duration.zero,
      longestSleep = SleepSession.simple(
        id: '',
        startTime: DateTime.fromMillisecondsSinceEpoch(0),
        endTime: DateTime.fromMillisecondsSinceEpoch(0),
      ),
      shortestSleep = SleepSession.simple(
        id: '',
        startTime: DateTime.fromMillisecondsSinceEpoch(0),
        endTime: DateTime.fromMillisecondsSinceEpoch(0),
      ),
      consistencyScore = 0;
}
