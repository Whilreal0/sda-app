import 'package:flutter/material.dart';

/// SDA App Color Palette
/// 
/// This class contains all the color constants used throughout the app
/// following the SDA brand guidelines.
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  /// Primary Color (Royal Blue)
  /// HEX: #1E3A8A | RGB: 30, 58, 138
  /// Use for: AppBar, buttons, icons, highlights
  static const Color primary = Color(0xFF1E3A8A);

  /// Secondary Color (Golden Yellow)
  /// HEX: #FBBF24 | RGB: 251, 191, 36
  /// Use for: accents, icons, buttons, call-to-action highlights
  static const Color secondary = Color(0xFFFBBF24);

  /// Background Color (Very Light Gray)
  /// HEX: #F9FAFB | RGB: 249, 250, 251
  /// Use for: screen surfaces
  static const Color background = Color(0xFFF9FAFB);

  /// Surface Color (White)
  /// HEX: #FFFFFF
  /// Use for: cards, containers, modals
  static const Color surface = Color(0xFFFFFFFF);

  /// Primary Text Color (Dark Gray)
  /// HEX: #111827
  /// Use for: clean, readable text
  static const Color textPrimary = Color(0xFF111827);

  /// Secondary Text Color (Muted Gray)
  /// HEX: #6B7280
  /// Use for: subtitles, secondary info
  static const Color textSecondary = Color(0xFF6B7280);

  /// System Colors
  static const Color error = Color(0xFFDC2626);
  static const Color success = Color(0xFF059669);
  static const Color warning = Color(0xFFD97706);
  static const Color info = Color(0xFF2563EB);

  /// Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, Color(0xFF3B82F6)],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, Color(0xFFF59E0B)],
  );

  /// Shadow Colors
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowDark = Color(0x4D000000);

  /// Border Colors
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderMedium = Color(0xFFD1D5DB);
  static const Color borderDark = Color(0xFF9CA3AF);

  /// Overlay Colors
  static const Color overlayLight = Color(0x0D000000);
  static const Color overlayMedium = Color(0x1A000000);
  static const Color overlayDark = Color(0x33000000);
}

/// Extension to easily access theme colors from context
extension AppColorsExtension on BuildContext {
  /// Get the current color scheme
  ColorScheme get colors => Theme.of(this).colorScheme;
  
  /// Get the current text theme
  TextTheme get textTheme => Theme.of(this).textTheme;
}
