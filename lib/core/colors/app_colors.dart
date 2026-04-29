import 'package:flutter/material.dart';

class AppColors {
  // ================= BACKGROUND COLORS =================
  static const Color backgroundPrimary = Color(0xFF9DB1B3);
  static const Color backgroundLight = Color(0xFFB0C3C5);
  static const Color backgroundDark = Color(0xFF7E9799);
  static const Color appBarColor = Color(0xFF7E9799);

  // ================= BUTTON COLORS =================
  static const Color buttonPrimary = Color(0xFF07565A);
  static const Color buttonDark = Color(0xFF053C3F);
  static const Color buttonLight = Color(0xFF0A6A6F);

  // ================= LIGHT / SURFACE COLORS =================
  static const Color surfacePrimary = Color(0xFFC5DADE);
  static const Color surfaceLight = Color(0xFFE3F1F3);
  static const Color surfaceDark = Color(0xFFA3C2C8);
  static const Color splashColor = Color(0xFFC5DADE);

  // ================= TEXT COLORS =================
  static const Color textPrimary = Color(0xFF053C3F);
  static const Color textSecondary = Color(0xFF7E9799);
  static const Color textOnDark = Colors.white;

  // ================= GRADIENTS =================
  static const LinearGradient mainGradient = LinearGradient(
    colors: [
      Color(0xFFC5DADE),
      Color(0xFF9DB1B3),
      Color(0xFF07565A),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}