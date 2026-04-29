# AI Gallery App Flutter Implementation

Flutter implementation of the supplied Figma prototype:

https://www.figma.com/design/yDkVonp995j7CpH41gRXWI/Untitled?node-id=0-1&p=f&t=dekX9c9ryy0GIChj-0

## Design Analysis

The Figma file contains a 7-frame iOS Photos-style gallery flow:

- Full-screen photo viewer with glass navigation, metadata pill, thumbnail rail, and bottom actions.
- Map search view with photo clusters, suggestion menu, search field, and dark iOS-style keyboard.
- Photo detail/info state with people chips, contextual menu, metadata, map preview, and actions.
- Collections home with blurred photo backdrop, People & Pets cards, Memories/Pinned/Featured rows, and display-options menu.
- Collapsed collection list with repeated rows and bottom Library/Collection segmented control.
- Album folder grid with sort/context menu.
- Memory movie creation/search screen with large glass prompt card, suggestions, search field, and keyboard.

## Extracted Design System

- Figma Dev Mode selected frame: `Home`, node `0-775`.
- Canvas: `402 x 874 px`, `box-sizing: border-box`.
- Frame background: `#000000`.
- Dev Mode color format: Hex.
- Dev Mode selection colors exposed: `#FFFFFF`, `#CA0011`, `#000000 · 10%`, plus additional hidden colors.
- Typography: SF Pro-style iOS typography with explicit status, title, section, body, and caption styles in `lib/design/design_constants.dart`.
- Radii: 6 px thumbnails, 10 px cards/chips, 14 px menus, 28 px prompt panel, circular icon buttons.
- Strokes: 1 px hairlines, 2 px selected thumbnail stroke, 0.8 px prompt outline.
- Shadows: glass control shadow `0 8 16 0 rgba(0,0,0,.18)` and menu shadow `0 12 22 0 rgba(0,0,0,.35)`.
- Responsive behavior: `flutter_screenutil` is initialized with `designSize: Size(402, 874)`. The authored Figma canvas is proportionally fitted on different screen sizes to preserve spacing and aspect ratio.
- Assets: cropped photo/map content assets live in `assets/gallery/`; screens are built with Flutter widgets rather than full-screen screenshots.

## Project Structure

```text
lib/
  main.dart
  design/
    design_constants.dart
  app/
    gallery_app.dart
  theme/
    gallery_theme.dart
  screens/
    gallery_screens.dart
  widgets/
    gallery_widgets.dart
assets/
  gallery/
```

## Run

```bash
flutter pub get
flutter run
```

## Verify

```bash
flutter analyze
flutter test
```
# temp_test
