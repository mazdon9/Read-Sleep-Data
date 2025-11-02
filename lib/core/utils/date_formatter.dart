/// Utility class for formatting dates and times consistently across the app
class DateTimeFormatter {
  /// Private constructor to prevent instantiation
  DateTimeFormatter._();

  /// Format a duration in hours and minutes
  /// Example: Duration(hours: 8, minutes: 30) -> "8h 30m"
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  /// Format a DateTime as a date string
  /// Example: "Jan 15, 2024"
  static String formatDate(DateTime dateTime) {
    return '${_getMonthAbbreviation(dateTime.month)} ${dateTime.day}, ${dateTime.year}';
  }

  /// Format a DateTime as a time string
  /// Example: "10:30 PM"
  static String formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    final minuteString = minute.toString().padLeft(2, '0');

    return '$displayHour:$minuteString $period';
  }

  /// Format a DateTime as a date and time string
  /// Example: "Jan 15, 2024 at 10:30 PM"
  static String formatDateTime(DateTime dateTime) {
    return '${formatDate(dateTime)} at ${formatTime(dateTime)}';
  }

  /// Format sleep session time range
  /// Example: "10:30 PM - 6:30 AM"
  static String formatSleepTimeRange(DateTime start, DateTime end) {
    return '${formatTime(start)} - ${formatTime(end)}';
  }

  /// Check if a date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Check if a date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  /// Get a relative date string (Today, Yesterday, or formatted date)
  static String getRelativeDateString(DateTime date) {
    if (isToday(date)) {
      return 'Today';
    } else if (isYesterday(date)) {
      return 'Yesterday';
    } else {
      return formatDate(date);
    }
  }

  /// Get the start of day for a given date
  static DateTime getStartOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Get the end of day for a given date
  static DateTime getEndOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }

  /// Get date range for the last N days including today
  static DateTimeRange getLastDaysRange(int days) {
    final end = getEndOfDay(DateTime.now());
    final start = getStartOfDay(
      DateTime.now().subtract(Duration(days: days - 1)),
    );
    return DateTimeRange(start: start, end: end);
  }

  /// Helper method to get month abbreviation
  static String _getMonthAbbreviation(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}

/// Simple date range class for representing date intervals
class DateTimeRange {
  final DateTime start;
  final DateTime end;

  const DateTimeRange({required this.start, required this.end});

  /// Duration of the range
  Duration get duration => end.difference(start);

  /// Check if a date falls within this range
  bool contains(DateTime date) {
    return date.isAfter(start) && date.isBefore(end) ||
        date.isAtSameMomentAs(start) ||
        date.isAtSameMomentAs(end);
  }

  @override
  String toString() {
    return 'DateTimeRange(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DateTimeRange && other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}
