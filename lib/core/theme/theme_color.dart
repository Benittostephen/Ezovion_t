import 'package:ezovion_task/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: AppColors.primary,
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    foregroundColor: Colors.white,
    elevation: 0,
    shadowColor: Colors.transparent,
    surfaceTintColor: AppColors.secondary,
    scrolledUnderElevation: 0,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.accent,
    selectionHandleColor: AppColors.accent,
    selectionColor: AppColors.accent.withValues(alpha: 0.5),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: AppColors.accent),
  ),
  iconTheme: const IconThemeData(color: AppColors.accent),
 /* inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 1.5, color: AppColors.accent),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    fillColor: Colors.white,
    filled: true,
    hintStyle: TextStyle(color: Colors.grey.shade600),
  ),*/
  // Remove purple splash/focus/highlight by overriding these colors
  splashColor: AppColors.accent.withValues(alpha: 0.15),
  highlightColor: AppColors.accent.withValues(alpha: 0.10),
  focusColor: AppColors.accent.withValues(alpha: 0.12),
  hoverColor: AppColors.accent.withValues(alpha: 0.08),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.accent,
    primary: AppColors.primary,
    surface: AppColors.secondary,
    onPrimary: AppColors.lightFont,
    onSecondary: AppColors.lightFont,
    onSurface: AppColors.lightFont,
    brightness: Brightness.light,
  ),
  cupertinoOverrideTheme: CupertinoThemeData(primaryColor: AppColors.accent),
);
