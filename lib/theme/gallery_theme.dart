import 'package:flutter/material.dart';

import '../design/design_constants.dart';

class GalleryAssets {
  static const lake = FigmaAsset.lake;
  static const map = FigmaAsset.map;
  static const boat = FigmaAsset.boat;
  static const lakeTile = FigmaAsset.lakeTile;
}

class GalleryPalette {
  static const black = FigmaColor.black;
  static const white = FigmaColor.white;
  static const blue = FigmaColor.actionBlue;
  static const red = FigmaColor.destructiveRed;
  static const keyboardBlue = FigmaColor.keyboardBase;
  static const keyboardAction = FigmaColor.keyboardAction;
  static const surface = FigmaColor.glassFill;
  static const surfaceRaised = FigmaColor.raisedSurface;
  static const dropdown = FigmaColor.glassStrongFill;
  static const divider = FigmaColor.dividerWhite20;
  static const glass = FigmaColor.glassFill;
}

class GallerySpacing {
  static const xs = FigmaSpacing.x4;
  static const sm = FigmaSpacing.x8;
  static const md = FigmaSpacing.x12;
  static const lg = FigmaSpacing.x18;
  static const xl = FigmaSpacing.x24;
}

class GalleryRadius {
  static const sm = FigmaRadius.thumbnail;
  static const md = FigmaRadius.card;
  static const lg = FigmaRadius.menu;
  static const pill = FigmaRadius.circle;
}

class GalleryTextStyles {
  static const status = FigmaType.status;
  static const title = FigmaType.title;
  static const section = FigmaType.section;
  static const body = FigmaType.body;
  static const caption = FigmaType.caption;
}

class GalleryTheme {
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: GalleryPalette.black,
      fontFamily: FigmaType.fontFamily,
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        surface: GalleryPalette.black,
        primary: GalleryPalette.blue,
        error: GalleryPalette.red,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
