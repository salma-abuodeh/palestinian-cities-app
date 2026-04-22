import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const cream     = Color(0xFFFAF2E7);
  static const sand      = Color(0xFFE3D1BF);
  static const tan       = Color(0xFFB99378);
  static const brown     = Color(0xFF6B4632);
  static const darkBrown = Color(0xFF1F1410);

  static const background = cream;
  static const surface    = sand;
  static const accent     = tan;
  static const primary    = brown;
  static const text       = darkBrown;
}

class AppTextStyles {
  // AppBar title — Italiana bold, large, cream, high contrast
  static TextStyle appBarTitle() => GoogleFonts.italiana(
        fontSize: 24,
        color: AppColors.cream,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        shadows: [
          Shadow(color: Colors.black45, blurRadius: 4, offset: Offset(0, 1)),
        ],
      );

  // Hero display — Italiana, very large
  static TextStyle display({double size = 28, Color color = AppColors.darkBrown}) =>
      GoogleFonts.italiana(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        shadows: [
          Shadow(color: Colors.black54, blurRadius: 6, offset: Offset(0, 2)),
        ],
      );

  // Section headings — Old Standard TT, bold, bigger, high contrast
  static TextStyle heading({
    double size = 18,
    Color color = AppColors.darkBrown,
    FontWeight weight = FontWeight.bold,
  }) =>
      GoogleFonts.oldStandardTt(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.8,
      );

  // Body text — Poppins medium weight for readability
  static TextStyle body({
    double size = 14,
    Color color = AppColors.darkBrown,
    FontWeight weight = FontWeight.normal,
  }) =>
      GoogleFonts.poppins(
        fontSize: size,
        color: color,
        fontWeight: weight == FontWeight.normal ? FontWeight.w400 : weight,
        height: 1.7,
      );

  // Captions — Poppins, slightly bolder than before
  static TextStyle caption({double size = 12, Color color = AppColors.brown}) =>
      GoogleFonts.poppins(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      );

  // Drawer nav
  static TextStyle nav({double size = 15, Color color = AppColors.darkBrown}) =>
      GoogleFonts.poppins(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w600,
      );
}

ThemeData buildAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.brown,
      secondary: AppColors.tan,
      surface: AppColors.sand,
      onPrimary: AppColors.cream,
      onSurface: AppColors.darkBrown,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBrown,
      foregroundColor: AppColors.cream,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.italiana(
        fontSize: 24,
        color: AppColors.cream,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      ),
      iconTheme: const IconThemeData(color: AppColors.cream),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.cream),
    cardTheme: CardThemeData(
      color: AppColors.cream,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: AppColors.sand, width: 1),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBrown,
      selectedItemColor: AppColors.tan,
      unselectedItemColor: AppColors.sand,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    dividerColor: AppColors.sand,
    useMaterial3: false,
  );
}
