import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextStyle defaultStyle(bool isDark) {
    return GoogleFonts.montserrat(
      color: isDark ? Colors.white : Colors.black87,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
  }

  static ThemeData themeData({bool isDark = false}) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: isDark ? Colors.black : Colors.white,
      cardColor: isDark ? const Color.fromARGB(221, 32, 30, 30) : Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? Colors.black : Colors.white,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black87,
        ),
      ),
      textTheme: textTheme(isDark),
    );
  }

  static TextTheme textTheme(bool isDark) {
    return TextTheme(
      headlineLarge: defaultStyle(isDark)
          .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
      headlineMedium: defaultStyle(isDark)
          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      headlineSmall: defaultStyle(isDark)
          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      titleLarge: defaultStyle(isDark)
          .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: defaultStyle(isDark)
          .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
      titleSmall: defaultStyle(isDark)
          .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      displayLarge: defaultStyle(isDark)
          .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
      displayMedium: defaultStyle(isDark)
          .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
      displaySmall: defaultStyle(isDark)
          .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
      bodyLarge: defaultStyle(isDark)
          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      bodyMedium: defaultStyle(isDark)
          .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      bodySmall: defaultStyle(isDark)
          .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
      labelLarge: defaultStyle(isDark)
          .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
      labelMedium: defaultStyle(isDark)
          .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
      labelSmall: defaultStyle(isDark)
          .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
