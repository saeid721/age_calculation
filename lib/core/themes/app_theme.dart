import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light();
    return base.copyWith(
      primaryColor: const Color(0xFF2E6CE4),
      scaffoldBackgroundColor: const Color(0xFFEAF0F7),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black87,
      ),
      textTheme: base.textTheme.apply(bodyColor: Colors.black87),
    );
  }
}
