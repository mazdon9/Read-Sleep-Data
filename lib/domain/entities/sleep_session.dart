/// Domain entity representing a sleep session
/// Contains all the essential information about a single sleep period
/// Immutable data class for value equality and copying
class SleepSession {
  /// Unique identifier for this sleep session
  final String id;

  /// When the sleep session started
  final DateTime startTime;

  /// When the sleep session ended
  final DateTime endTime;

  /// Optional sleep stages data (deep, light, REM, awake periods)
  final List<SleepStage> stages;

  /// Optional source of the data (e.g., "Health Connect", "Manual Entry")
  final String? source;

  /// Optional notes or additional metadata
  final String? notes;

  /// Creates a sleep session with start time, end time, and optional sleep stages
  const SleepSession({
    required this.id,
    required this.startTime,
    required this.endTime,
    this.stages = const [],
    this.source,
    this.notes,
  });

  /// Named constructor for a simple sleep session with just start and end times
  SleepSession.simple({
    required this.id,
    required this.startTime,
    required this.endTime,
    this.source,
  }) : stages = const [],
       notes = null;

  /// Create a copy of this sleep session with optional parameter changes
  SleepSession copyWith({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    List<SleepStage>? stages,
    String? source,
    String? notes,
  }) {
    return SleepSession(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      stages: stages ?? this.stages,
      source: source ?? this.source,
      notes: notes ?? this.notes,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SleepSession &&
            runtimeType == other.runtimeType &&
            id == other.id &&
            startTime == other.startTime &&
            endTime == other.endTime &&
            _listEquals(stages, other.stages) &&
            source == other.source &&
            notes == other.notes;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      startTime,
      endTime,
      Object.hashAll(stages),
      source,
      notes,
    );
  }

  @override
  String toString() {
    return 'SleepSession(id: $id, startTime: $startTime, endTime: $endTime, stages: ${stages.length}, source: $source, notes: $notes)';
  }

  /// Helper method to compare lists
  static bool _listEquals<T>(List<T> a, List<T> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

/// Extension methods for SleepSession to provide computed properties
extension SleepSessionExtensions on SleepSession {
  /// Total duration of the sleep session
  Duration get duration => endTime.difference(startTime);

  /// Duration in hours as a double (useful for calculations)
  double get durationInHours => duration.inMinutes / 60.0;

  /// Check if this sleep session occurred today
  bool get isToday {
    final now = DateTime.now();
    return startTime.year == now.year &&
        startTime.month == now.month &&
        startTime.day == now.day;
  }

  /// Check if this sleep session occurred yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return startTime.year == yesterday.year &&
        startTime.month == yesterday.month &&
        startTime.day == yesterday.day;
  }

  /// Get the date of this sleep session (start date)
  DateTime get sleepDate {
    return DateTime(startTime.year, startTime.month, startTime.day);
  }

  /// Check if this is a valid sleep session (end time after start time, reasonable duration)
  bool get isValid {
    if (endTime.isBefore(startTime)) return false;
    if (duration.inMinutes < 30) {
      return false; // Less than 30 minutes seems too short
    }
    if (duration.inHours > 24) {
      return false; // More than 24 hours seems too long
    }
    return true;
  }

  /// Get total time spent in deep sleep (if stage data available)
  Duration get deepSleepDuration {
    return stages
        .where((stage) => stage.type == SleepStageType.deep)
        .fold(Duration.zero, (total, stage) => total + stage.duration);
  }

  /// Get total time spent in light sleep (if stage data available)
  Duration get lightSleepDuration {
    return stages
        .where((stage) => stage.type == SleepStageType.light)
        .fold(Duration.zero, (total, stage) => total + stage.duration);
  }

  /// Get total time spent in REM sleep (if stage data available)
  Duration get remSleepDuration {
    return stages
        .where((stage) => stage.type == SleepStageType.rem)
        .fold(Duration.zero, (total, stage) => total + stage.duration);
  }

  /// Get total time spent awake during the sleep session (if stage data available)
  Duration get awakeDuration {
    return stages
        .where((stage) => stage.type == SleepStageType.awake)
        .fold(Duration.zero, (total, stage) => total + stage.duration);
  }

  /// Calculate sleep efficiency percentage (actual sleep time / time in bed)
  double get sleepEfficiency {
    if (stages.isEmpty) return 100.0; // Assume 100% if no stage data

    final totalSleepTime =
        deepSleepDuration + lightSleepDuration + remSleepDuration;
    final timeInBed = duration;

    if (timeInBed.inMinutes == 0) return 0.0;

    return (totalSleepTime.inMinutes / timeInBed.inMinutes) * 100.0;
  }
}

/// Represents a sleep stage within a sleep session
class SleepStage {
  /// Type of sleep stage
  final SleepStageType type;

  /// Start time of this stage
  final DateTime startTime;

  /// End time of this stage
  final DateTime endTime;

  const SleepStage({
    required this.type,
    required this.startTime,
    required this.endTime,
  });

  /// Duration of this sleep stage
  Duration get duration => endTime.difference(startTime);

  /// Create a copy of this sleep stage with optional parameter changes
  SleepStage copyWith({
    SleepStageType? type,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return SleepStage(
      type: type ?? this.type,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SleepStage &&
            runtimeType == other.runtimeType &&
            type == other.type &&
            startTime == other.startTime &&
            endTime == other.endTime;
  }

  @override
  int get hashCode {
    return Object.hash(type, startTime, endTime);
  }

  @override
  String toString() {
    return 'SleepStage(type: $type, startTime: $startTime, endTime: $endTime)';
  }
}

/// Enumeration of different sleep stage types
enum SleepStageType {
  /// Deep sleep stage (slow-wave sleep)
  deep,

  /// Light sleep stage
  light,

  /// REM (Rapid Eye Movement) sleep stage
  rem,

  /// Awake periods during the night
  awake,

  /// Unknown or unspecified stage
  unknown,
}

/// Extension for SleepStageType to provide display names and properties
extension SleepStageTypeExtensions on SleepStageType {
  /// Human-readable name for the sleep stage
  String get displayName {
    switch (this) {
      case SleepStageType.deep:
        return 'Deep Sleep';
      case SleepStageType.light:
        return 'Light Sleep';
      case SleepStageType.rem:
        return 'REM Sleep';
      case SleepStageType.awake:
        return 'Awake';
      case SleepStageType.unknown:
        return 'Unknown';
    }
  }

  /// Color associated with this sleep stage for UI display
  int get colorValue {
    switch (this) {
      case SleepStageType.deep:
        return 0xFF1565C0; // Dark blue
      case SleepStageType.light:
        return 0xFF42A5F5; // Light blue
      case SleepStageType.rem:
        return 0xFF7B1FA2; // Purple
      case SleepStageType.awake:
        return 0xFFEF5350; // Red
      case SleepStageType.unknown:
        return 0xFF9E9E9E; // Gray
    }
  }
}
