import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
// BRAND COLOR  –  Primary colour for this app
// ─────────────────────────────────────────────

int _brandPrimaryValue = 0xff0AAB83; // 500 (Main) – Dark Mode

MaterialColor brandColor = MaterialColor(
  _brandPrimaryValue,
  <int, Color>{
    100: const Color(0xffC5EFDF), // 100  Dark / D1FDEC Light
    200: const Color(0xff79C6A9), // 200  Dark / A4F6D7 Light
    300: const Color(0xff46B492), // 300  Dark / 6AEBC3 Light
    500: Color(_brandPrimaryValue), // 500 Main
    600: const Color(0xff006B50), // 600  Dark / 009B78 Light
  },
);

// Transparent variant (15 % opacity in dark, 10 % in light)
const Color brandTransparentDark = Color(0x2663E7C6); // #63E7C6 @ 15%
const Color brandTransparentLight = Color(0x1A0AB88D); // #0AB88D @ 10%

// ─────────────────────────────────────────────
// GREY  –  Background, text, and UI surfaces
// ─────────────────────────────────────────────

class AppGrey {
  AppGrey._();

  // ── Dark-mode values ──
  static const Color darkMain = Color(0xffFBFBFB);
  static const Color dark50 = Color(0xff202020);
  static const Color dark100 = Color(0xff171717);
  static const Color dark200 = Color(0xff2F2E2E);
  static const Color dark300 = Color(0xff706E6E);
  static const Color dark400 = Color(0xffABABAB);
  static const Color dark500 = Color(0xffBCBEBE);
  static const Color dark600 = Color(0xff626161);

  /// Input background  –  #F6F6F6 @ 70 %
  static const Color darkInputBg = Color(0xB3F6F6F6);

  /// Button background  –  #F6F6F6 @ 5 %
  static const Color darkButtonBg = Color(0x0DF6F6F6);

  /// Menu item background  –  #A09C9C @ 50 %
  static const Color darkMenuItemBg = Color(0x80A09C9C);

  // ── Light-mode values ──
  static const Color lightMain = Color(0xff1F1F1F);
  static const Color light50 = Color(0xffFEFEFE);
  static const Color light100 = Color(0xffFAFAFA);
  static const Color light200 = Color(0xffF6F6F6);
  static const Color light300 = Color(0xffD9D8D8);
  static const Color light400 = Color(0xffABABAB);
  static const Color light500 = Color(0xff888888);
  static const Color light600 = Color(0xff626161);

  /// Input background  –  #F6F6F6 @ 70 %  (same token, different context)
  static const Color lightInputBg = Color(0xB3F6F6F6);

  /// Button background  –  #F6F6F6 @ 5 %
  static const Color lightButtonBg = Color(0x0DF6F6F6);

  /// Menu item background  –  #B9B9B9 @ 20 %
  static const Color lightMenuItemBg = Color(0x33B9B9B9);
}

// ─────────────────────────────────────────────
// FIXED  –  Same in both light and dark mode
// ─────────────────────────────────────────────

class AppFixed {
  AppFixed._();

  static const Color white = Color(0xffFFFFFF);
  static const Color lightGrey = Color(0xffBDBEBF);

  /// Light grey transparent  –  #D9D8D8 @ 50 %
  static const Color lightGreyTransparent = Color(0x80D9D8D8);

  static const Color darkGrey = Color(0xff1F1F1F);
  static const Color black = Color(0xff141414);
}

// ─────────────────────────────────────────────
// ALERT  –  Toast, banner, and status colours
// ─────────────────────────────────────────────

class AppAlert {
  AppAlert._();

  // ── Dark-mode values ──
  static const Color darkSuccess500 = Color(0xff10713F);
  static const Color darkSuccess100 = Color(0xffD3FFE8);
  static const Color darkError500 = Color(0xffC12629);
  static const Color darkError100 = Color(0xffFAE2E3);
  static const Color darkInformation500 = Color(0xff2394CA);
  static const Color darkInformation100 = Color(0xffF1FAFF);
  static const Color darkWarning500 = Color(0xffBF8E20);
  static const Color darkWarning100 = Color(0xffFFFAF0);

  // ── Light-mode values ──
  static const Color lightSuccess500 = Color(0xff1D9757);
  static const Color lightSuccess100 = Color(0xffEEFBF2);
  static const Color lightError500 = Color(0xffD8383A);
  static const Color lightError100 = Color(0xffFEF2F6);
  static const Color lightInformation500 = Color(0xff20AEF1);
  static const Color lightInformation100 = Color(0xffEFFAFB);
  static const Color lightWarning500 = Color(0xffE8AD27);
  static const Color lightWarning100 = Color(0xffFFF9EB);
}

// ─────────────────────────────────────────────
// OTHERS  –  Accent colours used across the app
// ─────────────────────────────────────────────

class AppOthers {
  AppOthers._();

  // ── Dark-mode values ──
  static const Color darkPinkMain = Color(0xffF15B8A);
  static const Color darkPinkTransparent = Color(0x1AF15B8A); // 10%

  static const Color darkRedMain = Color(0xffF86464);
  static const Color darkRedTransparent = Color(0x1AF86464); // 10%

  static const Color darkPurpleMain = Color(0xffAB6BFF);
  static const Color darkPurpleTransparent = Color(0x1AAB6BFF); // 10%

  static const Color darkOrangeMain = Color(0xffFFA75C);
  static const Color darkOrangeTransparent = Color(0x1AFFA75C); // 10%

  static const Color darkNeonGreenMain = Color(0xffCFEA07);
  static const Color darkNeonGreenTransparent = Color(0x1ACFEA07); // 10%

  static const Color darkYellowMain = Color(0xffFFD103);
  static const Color darkYellowTransparent = Color(0x1AFFD103); // 10%

  static const Color darkBlueMain = Color(0xff41B4E6);
  static const Color darkBlueTransparent = Color(0x1A41B4E6); // 10%

  // ── Light-mode values ──
  static const Color lightPinkMain = Color(0xffFF5087);
  static const Color lightPinkTransparent = Color(0x1AFF5087); // 10%

  static const Color lightRedMain = Color(0xffE94848);
  static const Color lightRedTransparent = Color(0x1AE94848); // 10%

  static const Color lightPurpleMain = Color(0xff9241FB);
  static const Color lightPurpleTransparent = Color(0x1A9241FB); // 10%

  static const Color lightOrangeMain = Color(0xffFD8E2F);
  static const Color lightOrangeTransparent = Color(0x1AFD8E2F); // 10%

  static const Color lightNeonGreenMain = Color(0xffB6CE07);
  static const Color lightNeonGreenTransparent = Color(0x1ABED800); // 10%

  static const Color lightYellowMain = Color(0xffF8CD09);
  static const Color lightYellowTransparent = Color(0x1AF8CD09); // 10%

  static const Color lightBlueMain = Color(0xff3AB6EC);
  static const Color lightBlueTransparent = Color(0x1A3AB6EC); // 10%
}

// ─────────────────────────────────────────────
// GRADIENTS
// ─────────────────────────────────────────────

class AppGradients {
  AppGradients._();

  /// Light background gradient
  /// Figma: linear-gradient(180deg, #FAFAFA 31.73%, #FFF 108.28%)
  static const LinearGradient lightBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.3173, 1.0],
    colors: [
      Color(0xffFAFAFA), // AppGrey.light100
      Color(0xffFFFFFF), // AppFixed.white
    ],
  );

  /// Dark background gradient
  /// Figma: linear-gradient(180deg, #202020 31.73%, #171717 108.28%)
  static const LinearGradient darkBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.3173, 1.0],
    colors: [
      Color(0xff202020), // AppGrey.dark50
      Color(0xff171717), // AppGrey.dark100
    ],
  );

  /// Brand gradient  –  top to bottom green
  static const LinearGradient brand = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff46B492), // brandColor[300]
      Color(0xff0AAB83), // brandColor[500]
    ],
  );
}

// ─────────────────────────────────────────────
// THEME HELPERS
// ─────────────────────────────────────────────
//
// Usage example:
//
//   MaterialApp(
//     theme:    AppTheme.light,
//     darkTheme: AppTheme.dark,
//   )

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xff0AB88D),
      secondary: Color(0xff6AEBC3),
      surface: Color(0xffFAFAFA),
      error: Color(0xffD8383A),
    ),
    scaffoldBackgroundColor: AppGrey.light50,
    useMaterial3: true,
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff0AAB83),
      secondary: Color(0xff46B492),
      surface: Color(0xff2F2E2E),
      error: Color(0xffC12629),
    ),
    scaffoldBackgroundColor: AppGrey.dark50,
    useMaterial3: true,
  );
}