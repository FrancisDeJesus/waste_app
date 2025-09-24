import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTokens {
  // 🎨 Colors (adjust if Harlyn updates Figma)
  static const primary = Color(0xFF2E7D32); // green brand
  static const bg = Color(0xFFF5EFF7);     // soft lilac background
  static const surface = Colors.white;
  static const surfaceAlt = Color(0xFFF3EDF8); // card fill subtle
  static const iconBubble = Color(0xFFE8DEF8); // lavender circle behind icons
  static const text = Color(0xFF1E1E1E);
  static const textMuted = Color(0xFF8A8A8A);

  // 🧱 Layout
  static const r16 = 16.0;
  static const r20 = 20.0;
  static const pad = 16.0;
}

ThemeData appTheme() {
  final base = ThemeData.light(useMaterial3: true);
  final text = GoogleFonts.poppinsTextTheme(base.textTheme);

  return base.copyWith(
    scaffoldBackgroundColor: AppTokens.bg,
    colorScheme: base.colorScheme.copyWith(
      primary: AppTokens.primary,
      secondary: AppTokens.iconBubble,
      surface: AppTokens.surface,
      onSurface: AppTokens.text,
    ),
    textTheme: text.copyWith(
      titleLarge: text.titleLarge?.copyWith(fontWeight: FontWeight.w700),
      titleMedium: text.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      bodyMedium: text.bodyMedium?.copyWith(color: AppTokens.text),
      bodySmall: text.bodySmall?.copyWith(color: AppTokens.textMuted),
      labelLarge: text.labelLarge?.copyWith(fontWeight: FontWeight.w600),
    ),
    cardTheme: CardThemeData(
      color: AppTokens.surfaceAlt,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTokens.r20)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppTokens.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTokens.r16)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(44),
        side: const BorderSide(color: Color(0xFFDDDDDD)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTokens.r16)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(),
    ),
    chipTheme: base.chipTheme.copyWith(
      shape: StadiumBorder(side: BorderSide(color: Colors.black12)),
      labelStyle: text.labelSmall,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    ),
    iconTheme: const IconThemeData(size: 22),
  );
}
