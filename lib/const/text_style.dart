import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// TYPOGRAPHY
// Font    : SF Pro (uses system default on iOS/macOS; fallback on Android)
// Sizes   : 40 · 32 · 24 · 20 · 16 · 14 · 12 · 10 · 8  (px → logical pixels)
// Weights : Regular (w400) · Medium (w500) · Bold (w700)
// Tracking: 0.00%  →  letterSpacing: 0
// Leading : per spec (line-height values from the image)
// ─────────────────────────────────────────────────────────────────────────────

/// SF Pro font family string.
/// On iOS/macOS this resolves to the real SF Pro.
/// On Android/Web it falls back gracefully to the system sans-serif.
const String _sfPro = '.SF Pro Text';

// Helper to keep every definition concise.
TextStyle _t({
  required double size,
  required FontWeight weight,
  required double lineHeight, // in logical pixels (from the spec)
}) =>
    TextStyle(
      fontFamily: _sfPro,
      fontSize: size,
      fontWeight: weight,
      height: lineHeight / size, // Flutter uses a unitless multiplier
      letterSpacing: 0,
    );

// ─────────────────────────────────────────────────────────────────────────────
// 40 px  –  line-height 44 px
// ─────────────────────────────────────────────────────────────────────────────

/// 40 / Regular
final TextStyle text40Regular = _t(size: 40, weight: FontWeight.w400, lineHeight: 44);

/// 40 / Medium
final TextStyle text40Medium = _t(size: 40, weight: FontWeight.w500, lineHeight: 44);

/// 40 / Bold
final TextStyle text40Bold = _t(size: 40, weight: FontWeight.w700, lineHeight: 44);

// ─────────────────────────────────────────────────────────────────────────────
// 32 px  –  line-height 40 px
// ─────────────────────────────────────────────────────────────────────────────

/// 32 / Regular
final TextStyle text32Regular = _t(size: 32, weight: FontWeight.w400, lineHeight: 40);

/// 32 / Medium
final TextStyle text32Medium = _t(size: 32, weight: FontWeight.w500, lineHeight: 40);

/// 32 / Bold
final TextStyle text32Bold = _t(size: 32, weight: FontWeight.w700, lineHeight: 40);

// ─────────────────────────────────────────────────────────────────────────────
// 24 px  –  line-height 28 px
// ─────────────────────────────────────────────────────────────────────────────

/// 24 / Regular
final TextStyle text24Regular = _t(size: 24, weight: FontWeight.w400, lineHeight: 28);

/// 24 / Medium
final TextStyle text24Medium = _t(size: 24, weight: FontWeight.w500, lineHeight: 28);

/// 24 / Bold
final TextStyle text24Bold = _t(size: 24, weight: FontWeight.w700, lineHeight: 28);

// ─────────────────────────────────────────────────────────────────────────────
// 20 px  –  line-height 26 px
// ─────────────────────────────────────────────────────────────────────────────

/// 20 / Regular
final TextStyle text20Regular = _t(size: 20, weight: FontWeight.w400, lineHeight: 26);

/// 20 / Medium
final TextStyle text20Medium = _t(size: 20, weight: FontWeight.w500, lineHeight: 26);

/// 20 / Bold
final TextStyle text20Bold = _t(size: 20, weight: FontWeight.w700, lineHeight: 26);

// ─────────────────────────────────────────────────────────────────────────────
// 16 px  –  line-height 22 px
// ─────────────────────────────────────────────────────────────────────────────

/// 16 / Regular
final TextStyle text16Regular = _t(size: 16, weight: FontWeight.w400, lineHeight: 22);

/// 16 / Medium
final TextStyle text16Medium = _t(size: 16, weight: FontWeight.w500, lineHeight: 22);

/// 16 / Bold
final TextStyle text16Bold = _t(size: 16, weight: FontWeight.w700, lineHeight: 22);

// ─────────────────────────────────────────────────────────────────────────────
// 14 px  –  line-height 20 px
// ─────────────────────────────────────────────────────────────────────────────

/// 14 / Regular
final TextStyle text14Regular = _t(size: 14, weight: FontWeight.w400, lineHeight: 20);

/// 14 / Medium
final TextStyle text14Medium = _t(size: 14, weight: FontWeight.w500, lineHeight: 20);

/// 14 / Bold
final TextStyle text14Bold = _t(size: 14, weight: FontWeight.w700, lineHeight: 20);

// ─────────────────────────────────────────────────────────────────────────────
// 12 px  –  line-height 16 px
// ─────────────────────────────────────────────────────────────────────────────

/// 12 / Regular
final TextStyle text12Regular = _t(size: 12, weight: FontWeight.w400, lineHeight: 16);

/// 12 / Medium
final TextStyle text12Medium = _t(size: 12, weight: FontWeight.w500, lineHeight: 16);

/// 12 / Bold
final TextStyle text12Bold = _t(size: 12, weight: FontWeight.w700, lineHeight: 16);

// ─────────────────────────────────────────────────────────────────────────────
// 10 px  –  line-height 12 px
// ─────────────────────────────────────────────────────────────────────────────

/// 10 / Regular
final TextStyle text10Regular = _t(size: 10, weight: FontWeight.w400, lineHeight: 12);

/// 10 / Medium
final TextStyle text10Medium = _t(size: 10, weight: FontWeight.w500, lineHeight: 12);

/// 10 / Bold
final TextStyle text10Bold = _t(size: 10, weight: FontWeight.w700, lineHeight: 12);

// ─────────────────────────────────────────────────────────────────────────────
// 8 px  –  line-height 10 px
// ─────────────────────────────────────────────────────────────────────────────

/// 8 / Regular
final TextStyle text8Regular = _t(size: 8, weight: FontWeight.w400, lineHeight: 10);

/// 8 / Medium
final TextStyle text8Medium = _t(size: 8, weight: FontWeight.w500, lineHeight: 10);

/// 8 / Bold
final TextStyle text8Bold = _t(size: 8, weight: FontWeight.w700, lineHeight: 10);

// ─────────────────────────────────────────────────────────────────────────────
// CONVENIENCE MAP  –  look up any style at runtime if needed
// Usage:  AppTypography.style(size: 16, weight: AppFontWeight.bold)
// ─────────────────────────────────────────────────────────────────────────────

enum AppFontWeight { regular, medium, bold }

class AppTypography {
  AppTypography._();

  static TextStyle style({
    required double size,
    AppFontWeight weight = AppFontWeight.regular,
  }) {
    final FontWeight fw = switch (weight) {
      AppFontWeight.regular => FontWeight.w400,
      AppFontWeight.medium => FontWeight.w500,
      AppFontWeight.bold => FontWeight.w700,
    };

    final double lh = switch (size) {
      40 => 44,
      32 => 40,
      24 => 28,
      20 => 26,
      16 => 22,
      14 => 20,
      12 => 16,
      10 => 12,
      8 => 10,
      _ => size * 1.4, // sensible default for unlisted sizes
    };

    return _t(size: size, weight: fw, lineHeight: lh);
  }
}