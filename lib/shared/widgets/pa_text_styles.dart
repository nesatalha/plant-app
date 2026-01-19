import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';

class PATextStyles {
  static const TextStyle semibold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFF13231B),
  );

  static const TextStyle bold28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF13231B),
  );

  static const TextStyle medium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: PAColors.white,
  );

  static const TextStyle medium20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: PAColors.white,
  );

  static const TextStyle medium28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    letterSpacing: -1,
    color: Color(0xFF13231B),
  );

  static const TextStyle extraBold28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: Color(0xFF13231B),
  );

  static TextStyle regular16 = TextStyle(
    fontSize: 16,
    color: const Color(0xFF13231B).withOpacity(0.7),
  );

  static TextStyle regular12 = const TextStyle(
    fontSize: 12,
    color: Color(0xFF13231BB2),
  );

  static TextStyle light9 = const TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w300,
    color: PAColors.white,
  );

  static TextStyle light17 = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w300,
    color: PAColors.white,
  );

  static TextStyle light27 = const TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w300,
    color: PAColors.white,
  );

  static TextStyle bold27 = const TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.bold,
    color: PAColors.white,
  );
}
