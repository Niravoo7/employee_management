import "package:flutter/material.dart";

class ThemeColors {
  static const Color clrTransparent = Color(0x00ffffff);

  static const Color clrWhite = Color(0xFFFFFFFF);
  static const Color clrWhite50 = Color(0xFFF2F2F2);
  static const Color clrWhite100 = Color(0xFFE5E5E5);

  static const Color clrBlack = Color(0xFF000000);
  static const Color clrBlack50 = Color(0xFF323238);
  static const Color clrGray100 = Color(0xFF949C9E);

  static const Color clrPrimary = Color(0xFF1DA1F2);
  static const Color clrSecondary = Color(0xFFEDF8FF);

  static const Color clrError = Color(0xFFF34642);
  static const Color clrDisable = Color(0xFFE9E9ED);
}

class ThemeFonts {
  static const String roboto = "Roboto";
}

class FontSize {
  static const double fontSizeVerySmall = 10;
  static const double fontSizeSmall = 12;
  static const double fontSizeRegular = 14;
  static const double fontSizeMedium = 16;
  static const double fontSizeLarge = 18;
  static const double fontSizeVeryLarge = 20;
  static const double fontSize11 = 11;
  static const double fontSize13 = 13;
  static const double fontSize15 = 15;
  static const double fontSize19 = 19;
  static const double fontSize23 = 23;
  static const double fontSize28 = 28;
  static const double fontSize30 = 30;
  static const double fontSize80 = 80;
  static const double fontSize50 = 50;
}

class AppTheme {
  AppBarTheme appBarTheme() => const AppBarTheme(
    backgroundColor: ThemeColors.clrPrimary,
    foregroundColor: ThemeColors.clrWhite,
    titleTextStyle: TextStyle(
      color: ThemeColors.clrWhite,
      fontFamily: ThemeFonts.roboto,
      fontSize: FontSize.fontSizeLarge,
      fontWeight: FontWeight.w500,
    ),
  );

  /// Theme data for Material and Elevated button
  static ElevatedButtonThemeData elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: ThemeColors.clrWhite,
          backgroundColor: ThemeColors.clrPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: FontSize.fontSizeRegular,
            fontFamily: ThemeFonts.roboto,
          ),
        ),
      );

  /// Theme data for Floating Action Button
  static FloatingActionButtonThemeData floatingActionButtonThemeData(
    BuildContext context,
  ) => Theme.of(context).floatingActionButtonTheme.copyWith(
    backgroundColor: ThemeColors.clrPrimary,
    foregroundColor: ThemeColors.clrWhite,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 0,
  );
}

/// Project Light theme
ThemeData lightTheme(BuildContext context) => ThemeData(
  primaryColor: ThemeColors.clrPrimary,
  primaryColorLight: ThemeColors.clrSecondary,
  scaffoldBackgroundColor: ThemeColors.clrWhite,
  appBarTheme: AppTheme().appBarTheme(),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: ThemeColors.clrPrimary,
    selectionColor: ThemeColors.clrPrimary.withValues(alpha: 0.4),
    selectionHandleColor: ThemeColors.clrPrimary,
  ),
  useMaterial3: true,
  focusColor: ThemeColors.clrPrimary,
  elevatedButtonTheme: AppTheme.elevatedButtonThemeData(),
  floatingActionButtonTheme: AppTheme.floatingActionButtonThemeData(context),
  fontFamily: ThemeFonts.roboto,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: ThemeColors.clrPrimary,
    secondary: ThemeColors.clrSecondary,
    surface: ThemeColors.clrWhite,
  ),
  dialogTheme: const DialogThemeData(backgroundColor: ThemeColors.clrWhite),
);
