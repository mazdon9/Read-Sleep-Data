import 'package:flutter/material.dart';

/// Application color scheme and theme constants
class AppColors {
  /// Primary brand colors
  static const Color primary = Color(0xFF2196F3);
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFFBBDEFB);

  /// Secondary accent colors
  static const Color secondary = Color(0xFF03DAC6);
  static const Color secondaryDark = Color(0xFF018786);

  /// Surface and background colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F5F5);
  static const Color cardBackground = Color(0xFFFFFFFF);

  /// Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);

  /// Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  /// Sleep data specific colors
  static const Color sleepDeep = Color(0xFF1565C0);
  static const Color sleepLight = Color(0xFF42A5F5);
  static const Color sleepRem = Color(0xFF7B1FA2);
  static const Color sleepAwake = Color(0xFFEF5350);

  /// Utility colors
  static const Color transparent = Colors.transparent;
  static const Color shadow = Color(0x1F000000);
}

/// Application dimension constants for consistent spacing and sizing
class AppDimensions {
  /// Padding and margin values
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;

  /// Border radius values
  static const double radiusS = 4.0;
  static const double radiusM = 8.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;

  /// Icon sizes
  static const double iconS = 16.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXL = 48.0;

  /// Button dimensions
  static const double buttonHeight = 48.0;
  static const double buttonMinWidth = 88.0;

  /// Card and container dimensions
  static const double cardElevation = 2.0;
  static const double containerMinHeight = 60.0;

  /// Loading indicator size
  static const double loadingIndicatorSize = 24.0;
}

/// Duration constants for animations and delays
class AppDurations {
  /// Animation durations
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  /// Splash screen duration
  static const Duration splashDelay = Duration(seconds: 2);

  /// Debounce delays
  static const Duration debounceShort = Duration(milliseconds: 300);
  static const Duration debounceMedium = Duration(milliseconds: 500);

  /// Timeout durations
  static const Duration networkTimeout = Duration(seconds: 30);
  static const Duration permissionTimeout = Duration(seconds: 10);
}
