import 'package:flutter/material.dart';

/// Centralized color palette and [ThemeData] for the whole site.
///
/// Palette:
/// - Deep Blue: primary brand color (headers, nav, key CTAs)
/// - Industrial Orange/Amber: accent color (highlights, buttons, icons)
/// - Light Gray/White: clean background for readability
class AppColors {
  AppColors._();

  static const Color deepBlue = Color(0xFF0B2545);
  static const Color deepBlueDark = Color(0xFF081B34);
  static const Color deepBlueLight = Color(0xFF13315C);

  static const Color amber = Color(0xFFF2A93B);
  static const Color amberDark = Color(0xFFD98C1F);

  static const Color background = Color(0xFFF5F6F8);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1C1E21);
  static const Color textMuted = Color(0xFF5C6570);
  static const Color divider = Color(0xFFE0E3E7);
}

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.deepBlue,
        primary: AppColors.deepBlue,
        secondary: AppColors.amber,
        surface: AppColors.surface,
      ),
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Roboto',
    );

    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        displayLarge: const TextStyle(
          fontSize: 52,
          fontWeight: FontWeight.w800,
          color: AppColors.deepBlue,
          height: 1.1,
        ),
        displayMedium: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: AppColors.deepBlue,
          height: 1.15,
        ),
        headlineMedium: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: AppColors.deepBlue,
        ),
        titleLarge: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          color: AppColors.textMuted,
          height: 1.5,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          color: AppColors.textMuted,
          height: 1.5,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.deepBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.amber,
          foregroundColor: AppColors.deepBlue,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.divider, thickness: 1),
    );
  }
}

/// Responsive breakpoints shared across the app.
class AppBreakpoints {
  AppBreakpoints._();

  static const double mobile = 600;
  static const double tablet = 1024;

  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile && width < tablet;
  static bool isDesktop(double width) => width >= tablet;
}
