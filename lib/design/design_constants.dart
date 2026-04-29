import 'package:flutter/material.dart';

/// Pixel constants extracted from Figma Dev Mode.
///
/// Source: Figma Dev Mode Inspect panel for
/// `Home` frame (`node-id=0-775`), file `yDkVonp995j7CpH41gRXWI`.
/// The frame CSS shown by Figma:
///   width: 402px;
///   height: 874px;
///   background: #000;
///
/// Additional component constants below are organized from the same Dev Mode
/// visual layout and the rendered prototype. They intentionally stay as raw
/// Figma pixels; the app initializes `flutter_screenutil` with this same design
/// size and [GalleryFrame] scales the authored canvas proportionally.
class FigmaFrame {
  static const width = 402.0;
  static const height = 874.0;
  static const boxSizing = 'border-box';
}

class FigmaColor {
  // Figma frame background: #000.
  static const black = Color(0xFF000000);

  // Figma selection color: Miscellaneous/Keyboard - Glyphs - Primary #FFFFFF.
  static const white = Color(0xFFFFFFFF);

  // Figma selection color shown by Dev Mode: #CA0011.
  static const destructiveRed = Color(0xFFCA0011);

  // Figma selection color shown by Dev Mode: #000000 · 10%.
  static const black10 = Color(0x1A000000);

  // Raster/prototype visible design tokens used by repeated components.
  static const actionBlue = Color(0xFF6BAFDB);
  static const glassFill = Color(0x4D111418);
  static const glassStrongFill = Color(0xE6191B1F);
  static const dividerWhite20 = Color(0x33FFFFFF);
  static const keyboardBase = Color(0xFF173643);
  static const keyboardAction = Color(0xFF235F87);
  static const raisedSurface = Color(0xFF1D1D20);
}

class FigmaRadius {
  static const thumbnail = 6.0;
  static const card = 10.0;
  static const menu = 14.0;
  static const prompt = 28.0;
  static const circle = 999.0;
}

class FigmaStroke {
  static const hairline = 1.0;
  static const selectedThumbnail = 2.0;
  static const prompt = 0.8;
}

class FigmaSpacing {
  static const x4 = 4.0;
  static const x5 = 5.0;
  static const x6 = 6.0;
  static const x8 = 8.0;
  static const x10 = 10.0;
  static const x12 = 12.0;
  static const x14 = 14.0;
  static const x16 = 16.0;
  static const x18 = 18.0;
  static const x22 = 22.0;
  static const x24 = 24.0;
  static const x27 = 27.0;
  static const x28 = 28.0;
  static const x34 = 34.0;
  static const x45 = 45.0;
}

class FigmaSize {
  static const statusBatteryWidth = 18.0;
  static const statusBatteryHeight = 9.0;
  static const circleButton = 30.0;
  static const topMetaPillHeight = 44.0;
  static const actionPillHeight = 30.0;
  static const searchHeight = 32.0;
  static const thumbnail = 42.0;
  static const photoChip = 54.0;
  static const keyboardHeight = 160.0;
  static const keyboardKeyHeight = 30.0;
  static const bottomHomeIndicatorWidth = 110.0;
  static const bottomHomeIndicatorHeight = 4.0;
  static const largeCardHeight = 104.0;
  static const smallTileHeight = 64.0;
  static const albumMiniGap = 3.0;
}

class FigmaPosition {
  static const statusTop = 26.0;
  static const statusLeft = 45.0;
  static const statusRight = 38.0;

  static const homeToolbarTop = 78.0;
  static const homeToolbarHorizontal = 22.0;
  static const thumbnailBottom = 126.0;
  static const actionBarBottom = 68.0;
  static const actionBarHorizontal = 28.0;

  static const mapTitleTop = 76.0;
  static const mapBackTop = 74.0;
  static const mapChipSmallTop = 126.0;
  static const mapChipLargeTop = 300.0;
  static const mapSuggestionsTop = 350.0;
  static const searchBottom = 222.0;

  static const collectionsHeaderTop = 76.0;
  static const collectionsContentLeft = 16.0;
  static const collectionsPeopleTop = 150.0;
  static const collectionsMemoryTop = 310.0;
  static const collectionsPinnedTop = 438.0;
  static const collectionsFeaturedTop = 566.0;
  static const collectionsBottomBarBottom = 28.0;
}

class FigmaShadow {
  // Repeated translucent glass/card shadow from the prototype.
  static const glass = BoxShadow(
    color: Color(0x2E000000),
    blurRadius: 16,
    spreadRadius: 0,
    offset: Offset(0, 8),
  );

  static const menu = BoxShadow(
    color: Color(0x59000000),
    blurRadius: 22,
    spreadRadius: 0,
    offset: Offset(0, 12),
  );
}

class FigmaType {
  static const fontFamily = 'SF Pro Display';
  static const letterSpacing = 0.0;

  static const status = TextStyle(
    fontFamily: fontFamily,
    color: FigmaColor.white,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1,
    letterSpacing: letterSpacing,
  );

  static const title = TextStyle(
    fontFamily: fontFamily,
    color: FigmaColor.white,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    height: 1.05,
    letterSpacing: letterSpacing,
  );

  static const section = TextStyle(
    fontFamily: fontFamily,
    color: FigmaColor.white,
    fontSize: 17,
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: letterSpacing,
  );

  static const body = TextStyle(
    fontFamily: fontFamily,
    color: FigmaColor.white,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.15,
    letterSpacing: letterSpacing,
  );

  static const caption = TextStyle(
    fontFamily: fontFamily,
    color: FigmaColor.white,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.1,
    letterSpacing: letterSpacing,
  );
}

class FigmaAsset {
  static const lake = 'assets/gallery/lake_house.png';
  static const map = 'assets/gallery/map.png';
  static const boat = 'assets/gallery/boat.png';
  static const lakeTile = 'assets/gallery/lake_tile.png';
}
