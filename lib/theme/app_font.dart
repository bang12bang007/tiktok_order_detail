import 'package:flutter/material.dart';

class AppFont {
  // TikTok Sans Font Family Names
  static const String sans = 'TikTokSans';
  static const String display = 'TikTokDisplay';

  static const FontWeight normal = FontWeight.w400; // Regular
  static const FontWeight medium = FontWeight.w500; // Medium
  static const FontWeight bold = FontWeight.w700;   // Bold
}

extension AppFontTextStyleExt on TextStyle {
  /// Applies TikTok Sans Regular/Medium/Bold family
  TextStyle get tikTokSans => copyWith(fontFamily: AppFont.sans);

  /// Applies TikTok Display font family
  TextStyle get tikTokDisplay => copyWith(fontFamily: AppFont.display);

  /// Helper getters for custom AppFont weights
  TextStyle get normalWeight => copyWith(fontWeight: AppFont.normal);
  TextStyle get mediumWeight => copyWith(fontWeight: AppFont.medium);
  TextStyle get boldWeight => copyWith(fontWeight: AppFont.bold);
}

extension BuildContextFontExt on BuildContext {
  /// Quick helper to create standard TikTok TextStyles on the fly
  TextStyle tikTokStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight = AppFont.normal,
    double? height,
    double? letterSpacing,
    bool isDisplay = false,
  }) {
    return TextStyle(
      fontFamily: isDisplay ? AppFont.display : AppFont.sans,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
