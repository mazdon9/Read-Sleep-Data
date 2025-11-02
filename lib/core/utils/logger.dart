import 'dart:developer';

/// Centralized logging utility for the application
/// Provides different log levels and consistent formatting
class AppLogger {
  /// Private constructor to prevent instantiation
  AppLogger._();

  /// Enable/disable logging (useful for production builds)
  static bool _isEnabled = true;

  /// Enable or disable logging globally
  static void setEnabled(bool enabled) {
    _isEnabled = enabled;
  }

  /// Log debug information
  /// Use for detailed information during development
  static void debug(String message, [String? tag]) {
    if (_isEnabled) {
      log('🐛 [DEBUG] ${tag != null ? '[$tag] ' : ''}$message');
    }
  }

  /// Log general information
  /// Use for general application flow information
  static void info(String message, [String? tag]) {
    if (_isEnabled) {
      log('ℹ️ [INFO] ${tag != null ? '[$tag] ' : ''}$message');
    }
  }

  /// Log warning messages
  /// Use for potentially problematic situations
  static void warning(String message, [String? tag]) {
    if (_isEnabled) {
      log('⚠️ [WARNING] ${tag != null ? '[$tag] ' : ''}$message');
    }
  }

  /// Log error messages
  /// Use for error conditions that don't crash the app
  static void error(
    String message, [
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (_isEnabled) {
      log(
        '❌ [ERROR] ${tag != null ? '[$tag] ' : ''}$message',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Log fatal errors
  /// Use for critical errors that might crash the app
  static void fatal(
    String message, [
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (_isEnabled) {
      log(
        '💀 [FATAL] ${tag != null ? '[$tag] ' : ''}$message',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Log health-related operations
  /// Specialized logging for health data operations
  static void health(String message, [Object? data]) {
    if (_isEnabled) {
      log('🏥 [HEALTH] $message${data != null ? ' | Data: $data' : ''}');
    }
  }

  /// Log navigation events
  /// Specialized logging for route changes
  static void navigation(String from, String to) {
    if (_isEnabled) {
      log('🧭 [NAVIGATION] $from → $to');
    }
  }

  /// Log permission-related events
  /// Specialized logging for permission requests and status
  static void permission(String message, String permissionType) {
    if (_isEnabled) {
      log('🔐 [PERMISSION] [$permissionType] $message');
    }
  }
}
