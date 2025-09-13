import 'package:flutter/material.dart';

class ThemeConectar {
  static const primaryColor = Color(0xFF0bc07d);
  static const secondaryColor = Color(0xFFffffff);
  static const surfaceColor = Color(0xfff8fafc);
  static final onSurface = Colors.grey[100];
  static const backgroundContainerColor = Color(0xfffffbff);
  static const errorColor = Color(0xffef4444);
  static const successColor = Color(0xff10b981);
  static const warningColor = Color(0xfff59e0b);

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        onSurface: onSurface,
        error: errorColor,
        primaryContainer: backgroundContainerColor,
      ),
      scaffoldBackgroundColor: backgroundContainerColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xff1e293b),
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xff1e293b),
        ),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
        bodySmall: TextStyle(fontSize: 12, color: Color(0xff1e293b)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor.withValues(alpha: 0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: errorColor),
        ),
        hintStyle: TextStyle(color: Colors.grey.shade500),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
