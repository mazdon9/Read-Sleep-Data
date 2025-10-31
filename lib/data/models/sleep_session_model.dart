/// Simple sleep session data model without inheritance
class SleepSessionModel {
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final String? source;
  final String? notes;

  const SleepSessionModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    this.source,
    this.notes,
  });

  /// Create a simple SleepSessionModel with just basic data
  const SleepSessionModel.simple({
    required this.id,
    required this.startTime,
    required this.endTime,
    this.source,
  }) : notes = null;

  /// Create SleepSessionModel from JSON data
  factory SleepSessionModel.fromJson(Map<String, dynamic> json) {
    return SleepSessionModel(
      id: json['id'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      source: json['source'] as String?,
      notes: json['notes'] as String?,
    );
  }

  /// Convert SleepSessionModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'source': source,
      'notes': notes,
    };
  }

  /// Create SleepSessionModel from Health Connect data
  factory SleepSessionModel.fromHealthData({
    required String id,
    required DateTime startTime,
    required DateTime endTime,
    String? source = 'Health Connect',
    String? notes,
  }) {
    return SleepSessionModel(
      id: id,
      startTime: startTime,
      endTime: endTime,
      source: source,
      notes: notes,
    );
  }

  /// Create a copy with updated values
  SleepSessionModel copyWith({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    String? source,
    String? notes,
  }) {
    return SleepSessionModel(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      source: source ?? this.source,
      notes: notes ?? this.notes,
    );
  }

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

  /// Check if this is a valid sleep session
  bool get isValid {
    if (endTime.isBefore(startTime)) return false;
    if (duration.inMinutes < 30)
      return false; // Less than 30 minutes seems too short
    if (duration.inHours > 24)
      return false; // More than 24 hours seems too long
    return true;
  }

  @override
  String toString() {
    return 'SleepSessionModel(id: $id, startTime: $startTime, endTime: $endTime, '
        'duration: ${duration.inHours}h ${duration.inMinutes % 60}m, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SleepSessionModel &&
        other.id == id &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.source == source &&
        other.notes == notes;
  }

  @override
  int get hashCode {
    return Object.hash(id, startTime, endTime, source, notes);
  }
}
