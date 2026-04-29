import 'package:flutter/material.dart';

import '../design/design_constants.dart';
import '../theme/gallery_theme.dart';

class GalleryFrame extends StatelessWidget {
  const GalleryFrame({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ColoredBox(
          color: GalleryPalette.black,
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                // Figma Dev Mode frame: 402 x 874.
                width: FigmaFrame.width,
                height: FigmaFrame.height,
                child: ClipRect(child: child),
              ),
            ),
          ),
        );
      },
    );
  }
}

class IosStatusBar extends StatelessWidget {
  const IosStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('9:41', style: GalleryTextStyles.status),
        const Spacer(),
        const Icon(Icons.signal_cellular_alt_rounded, size: 14),
        const SizedBox(width: 4),
        const Icon(Icons.wifi_rounded, size: 14),
        const SizedBox(width: 4),
        Container(
          width: 18,
          height: 9,
          decoration: BoxDecoration(
            color: GalleryPalette.white,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    );
  }
}

class PhotoBackground extends StatelessWidget {
  const PhotoBackground({
    required this.asset,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String asset;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(asset, fit: fit, filterQuality: FilterQuality.high);
  }
}

class ScreenScrim extends StatelessWidget {
  const ScreenScrim({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x26000000),
            Color(0x00000000),
            Color(0x22000000),
            Color(0xDD000000),
          ],
          stops: [0, 0.45, 0.72, 1],
        ),
      ),
    );
  }
}

class MapTint extends StatelessWidget {
  const MapTint({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.05),
            Colors.transparent,
            Colors.black.withValues(alpha: 0.28),
          ],
        ),
      ),
    );
  }
}

class GlassPill extends StatelessWidget {
  const GlassPill({
    required this.child,
    this.height = 34,
    this.padding = EdgeInsets.zero,
    this.onTap,
    super.key,
  });

  final Widget child;
  final double height;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: GalleryPalette.glass,
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: FigmaShadow.glass.blurRadius,
            offset: FigmaShadow.glass.offset,
          ),
        ],
      ),
      child: child,
    );

    if (onTap == null) return content;
    return GestureDetector(onTap: onTap, child: content);
  }
}

class CircleGlassButton extends StatelessWidget {
  const CircleGlassButton({
    required this.icon,
    this.color = Colors.white,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: GalleryPalette.glass,
          border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
        ),
        child: Icon(icon, color: color, size: 19),
      ),
    );
  }
}

class GlassIconButton extends StatelessWidget {
  const GlassIconButton({required this.icon, this.onTap, super.key});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: GalleryPalette.glass,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
        ),
        child: Icon(icon, size: 17),
      ),
    );
  }
}

class ThumbnailStrip extends StatelessWidget {
  const ThumbnailStrip({
    required this.selectedIndex,
    required this.onSelect,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    const assets = [
      GalleryAssets.lake,
      GalleryAssets.boat,
      GalleryAssets.lakeTile,
      GalleryAssets.lake,
      GalleryAssets.boat,
      GalleryAssets.lakeTile,
    ];

    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        scrollDirection: Axis.horizontal,
        itemCount: assets.length,
        separatorBuilder: (_, _) => const SizedBox(width: 5),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onSelect(index),
            child: Container(
              width: 42,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                border: Border.all(
                  color: index == selectedIndex
                      ? GalleryPalette.white
                      : Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(GalleryRadius.sm),
              ),
              child: Image.asset(assets[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}

class PhotoActionBar extends StatelessWidget {
  const PhotoActionBar({
    required this.favorite,
    required this.onFavorite,
    super.key,
  });

  final bool favorite;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleGlassButton(icon: Icons.ios_share_rounded),
        GlassPill(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          onTap: onFavorite,
          child: Icon(
            favorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            size: 20,
            color: favorite ? GalleryPalette.red : GalleryPalette.white,
          ),
        ),
        const GlassPill(
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Icon(Icons.control_point_duplicate_rounded, size: 18),
        ),
        const GlassPill(
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Icon(Icons.info_outline_rounded, size: 18),
        ),
        const CircleGlassButton(
          icon: Icons.delete_outline_rounded,
          color: GalleryPalette.red,
        ),
      ],
    );
  }
}

class PhotoChip extends StatelessWidget {
  const PhotoChip({required this.asset, required this.label, super.key});

  final String asset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(GalleryRadius.md),
          child: Image.asset(asset, width: 54, height: 54, fit: BoxFit.cover),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.48),
            borderRadius: BorderRadius.circular(GalleryRadius.md),
          ),
          child: Text(label, style: GalleryTextStyles.caption),
        ),
      ],
    );
  }
}

class SuggestionsMenu extends StatelessWidget {
  const SuggestionsMenu({required this.items, super.key});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 122,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                child: Text(item, style: GalleryTextStyles.caption),
              ),
            )
            .toList(),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    required this.text,
    required this.onChanged,
    this.microphone = false,
    super.key,
  });

  final String text;
  final ValueChanged<String> onChanged;
  final bool microphone;

  @override
  Widget build(BuildContext context) {
    return GlassPill(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, size: 17),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GalleryTextStyles.body.copyWith(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (microphone) const Icon(Icons.mic_none_rounded, size: 16),
          if (!microphone)
            GestureDetector(
              onTap: () => onChanged(''),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.20),
                ),
                child: const Icon(Icons.close_rounded, size: 17),
              ),
            ),
        ],
      ),
    );
  }
}

class FakeKeyboard extends StatelessWidget {
  const FakeKeyboard({required this.onKey, super.key});

  final ValueChanged<String> onKey;

  @override
  Widget build(BuildContext context) {
    const rows = ['qwertyuiop', 'asdfghjkl', 'zxcvbnm'];

    return Container(
      height: 160,
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      decoration: const BoxDecoration(color: Color(0xEA0D2834)),
      child: Column(
        children: [
          for (final row in rows) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (row == rows.last) KeyboardKey(label: '⇧', onTap: () {}),
                for (final letter in row.characters)
                  KeyboardKey(label: letter, onTap: () => onKey(letter)),
                if (row == rows.last)
                  KeyboardKey(label: '⌫', onTap: () => onKey('backspace')),
              ],
            ),
            const SizedBox(height: 5),
          ],
          Row(
            children: [
              KeyboardKey(label: '?123', width: 38, onTap: () {}),
              KeyboardKey(label: '⌘', width: 28, onTap: () {}),
              KeyboardKey(label: 'globe', width: 36, onTap: () {}),
              Expanded(
                child: KeyboardKey(label: '', onTap: () => onKey(' ')),
              ),
              KeyboardKey(label: '.', width: 24, onTap: () => onKey('.')),
              KeyboardKey(label: '↵', width: 40, accent: true, onTap: () {}),
            ],
          ),
          const Spacer(),
          Container(
            width: 110,
            height: 4,
            decoration: BoxDecoration(
              color: GalleryPalette.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

class KeyboardKey extends StatelessWidget {
  const KeyboardKey({
    required this.label,
    required this.onTap,
    this.width = 26,
    this.accent = false,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final double width;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final displayLabel = label == 'globe' ? '◉' : label;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: accent
              ? GalleryPalette.keyboardAction
              : GalleryPalette.keyboardBlue,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white30),
        ),
        child: Text(displayLabel, style: GalleryTextStyles.body),
      ),
    );
  }
}

class AvatarRow extends StatelessWidget {
  const AvatarRow({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.orange,
      Colors.blueGrey,
      Colors.brown,
      Colors.purpleAccent,
    ];

    return Row(
      children: [
        for (final color in colors)
          Container(
            width: 23,
            height: 23,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: const Icon(Icons.person, size: 14, color: Colors.white),
          ),
      ],
    );
  }
}

class PhotoMetaBlock extends StatelessWidget {
  const PhotoMetaBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Saturday, September 29, 2026',
                style: GalleryTextStyles.body.copyWith(fontSize: 12),
              ),
            ),
            Text(
              'Adjust',
              style: GalleryTextStyles.caption.copyWith(
                color: GalleryPalette.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Expanded(
              child: GlassPill(
                height: 34,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Apple iPhone 15 Pro',
                    style: GalleryTextStyles.caption,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Help',
              style: GalleryTextStyles.caption.copyWith(
                color: GalleryPalette.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Wide Camera - 24 mm f1.78',
          style: GalleryTextStyles.caption,
        ),
        const Text(
          '4 MP - 2272 x 1704 - 2.1 MB',
          style: GalleryTextStyles.caption,
        ),
      ],
    );
  }
}

class FrostedGalleryBackdrop extends StatelessWidget {
  const FrostedGalleryBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(GalleryAssets.boat, fit: BoxFit.cover),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.72),
                Colors.black.withValues(alpha: 0.92),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BlurredColorBackdrop extends StatelessWidget {
  const BlurredColorBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(GalleryAssets.lakeTile),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: 0.55),
            Colors.black.withValues(alpha: 0.75),
          ],
        ),
      ),
      child: Container(color: Colors.black.withValues(alpha: 0.42)),
    );
  }
}

class CollectionsHeader extends StatelessWidget {
  const CollectionsHeader({required this.menuOpen, super.key});

  final bool menuOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Collections', style: GalleryTextStyles.title),
              Text(
                'Syncing Paused 9 Items',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
        ),
        if (!menuOpen) const CircleGlassButton(icon: Icons.more_horiz_rounded),
        const SizedBox(width: 8),
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            image: const DecorationImage(
              image: AssetImage(GalleryAssets.lakeTile),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({required this.title, this.chevron = false, super.key});

  final String title;
  final bool chevron;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: GalleryTextStyles.section),
        if (chevron) const Icon(Icons.chevron_right_rounded, size: 20),
        const Spacer(),
        Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
            color: Color(0xFF2D3034),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.keyboard_arrow_down_rounded, size: 17),
        ),
      ],
    );
  }
}

class LargePhotoCard extends StatelessWidget {
  const LargePhotoCard({required this.asset, required this.title, super.key});

  final String asset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(GalleryRadius.md),
      child: SizedBox(
        height: 104,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(asset, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: Text(
                title,
                style: GalleryTextStyles.body.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallPhotoTile extends StatelessWidget {
  const SmallPhotoTile({required this.asset, required this.label, super.key});

  final String asset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 64,
        margin: const EdgeInsets.only(right: 6),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(asset, fit: BoxFit.cover),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(label, style: GalleryTextStyles.caption),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PeoplePets extends StatelessWidget {
  const PeoplePets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SectionTitle(title: 'People & Pets'),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: LargePhotoCard(
                asset: GalleryAssets.lake,
                title: 'Youtube\nthumbnails',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: LargePhotoCard(
                asset: GalleryAssets.boat,
                title: 'Best Shots',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MemoryRow extends StatelessWidget {
  const MemoryRow({this.title = 'Memories', super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title, chevron: true),
        const SizedBox(height: 8),
        const Row(
          children: [
            SmallPhotoTile(asset: GalleryAssets.lake, label: 'Dan...'),
            SmallPhotoTile(asset: GalleryAssets.boat, label: 'Mack...'),
            SmallPhotoTile(asset: GalleryAssets.lakeTile, label: 'Olive...'),
            SmallPhotoTile(asset: GalleryAssets.boat, label: 'Olive...'),
          ],
        ),
      ],
    );
  }
}

class FeatureRow extends StatelessWidget {
  const FeatureRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Featured Photos', chevron: true),
        SizedBox(height: 8),
        Row(
          children: [
            SmallPhotoTile(asset: GalleryAssets.boat, label: 'Library'),
            SmallPhotoTile(asset: GalleryAssets.lake, label: 'Collection'),
            SmallPhotoTile(asset: GalleryAssets.lakeTile, label: ''),
          ],
        ),
      ],
    );
  }
}

class ViewOptionsMenu extends StatelessWidget {
  const ViewOptionsMenu({required this.onCollapse, super.key});

  final VoidCallback onCollapse;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      width: 128,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.view_agenda_rounded, size: 19),
              SizedBox(width: 13),
              Icon(Icons.grid_view_rounded, size: 19),
              SizedBox(width: 13),
              Icon(Icons.view_module_rounded, size: 19),
            ],
          ),
          const SizedBox(height: 12),
          const Text('Show All', style: GalleryTextStyles.caption),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: onCollapse,
            child: const Text('Collapse All', style: GalleryTextStyles.caption),
          ),
          const SizedBox(height: 12),
          const Text('Reorder', style: GalleryTextStyles.caption),
        ],
      ),
    );
  }
}

class CollectionListTile extends StatelessWidget {
  const CollectionListTile(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: Row(
        children: [
          Text(title, style: GalleryTextStyles.section),
          const Icon(Icons.chevron_right_rounded),
          const Spacer(),
          Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              color: Color(0xFF2D3034),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.keyboard_arrow_down_rounded, size: 17),
          ),
        ],
      ),
    );
  }
}

class AlbumGrid extends StatelessWidget {
  const AlbumGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final labels = [
      'Friends',
      'Family',
      'Friends',
      'Family',
      'Friends',
      'Family',
    ];

    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: labels.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 10,
        childAspectRatio: 1.06,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(GalleryRadius.md),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(color: GalleryPalette.surfaceRaised),
              Padding(
                padding: const EdgeInsets.all(4),
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  children: const [
                    AlbumMiniImage(asset: GalleryAssets.boat),
                    AlbumMiniImage(asset: GalleryAssets.boat),
                    AlbumMiniImage(asset: GalleryAssets.boat),
                    AlbumMiniImage(asset: GalleryAssets.boat),
                  ],
                ),
              ),
              Positioned(
                left: 8,
                bottom: 6,
                child: Text(
                  labels[index],
                  style: GalleryTextStyles.body.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AlbumMiniImage extends StatelessWidget {
  const AlbumMiniImage({required this.asset, super.key});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(asset, fit: BoxFit.cover),
    );
  }
}

class LibraryBottomBar extends StatelessWidget {
  const LibraryBottomBar({
    required this.selectedTab,
    required this.onTabChanged,
    super.key,
  });

  final String selectedTab;
  final ValueChanged<String> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlassPill(
          height: 34,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SegmentButton(
                label: 'Library',
                selected: selectedTab == 'Library',
                onTap: () => onTabChanged('Library'),
              ),
              SegmentButton(
                label: 'Collection',
                selected: selectedTab == 'Collection',
                onTap: () => onTabChanged('Collection'),
              ),
            ],
          ),
        ),
        const Spacer(),
        GlassIconButton(icon: Icons.search_rounded, onTap: () {}),
      ],
    );
  }
}

class SegmentButton extends StatelessWidget {
  const SegmentButton({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? Colors.white.withValues(alpha: 0.16)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: GalleryTextStyles.caption.copyWith(
            color: selected ? GalleryPalette.white : Colors.white70,
          ),
        ),
      ),
    );
  }
}

class PromptList extends StatelessWidget {
  const PromptList({super.key});

  @override
  Widget build(BuildContext context) {
    const prompts = [
      'Momonts with sean over time',
      'Eating together as a family',
      'Trips with kim, with a happy song',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final prompt in prompts)
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Row(
              children: [
                const Icon(Icons.search_rounded, size: 16),
                const SizedBox(width: 12),
                Text(prompt, style: GalleryTextStyles.body),
              ],
            ),
          ),
      ],
    );
  }
}

class GlassCard extends StatelessWidget {
  const GlassCard({
    required this.child,
    this.width,
    this.padding = const EdgeInsets.all(12),
    super.key,
  });

  final Widget child;
  final double? width;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: GalleryPalette.dropdown,
        borderRadius: BorderRadius.circular(GalleryRadius.lg),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: child,
    );
  }
}

class MenuRow extends StatelessWidget {
  const MenuRow({
    required this.label,
    this.icon,
    this.trailing,
    this.red = false,
    super.key,
  });

  final IconData? icon;
  final String label;
  final IconData? trailing;
  final bool red;

  @override
  Widget build(BuildContext context) {
    final color = red ? GalleryPalette.red : GalleryPalette.white;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          if (icon != null) Icon(icon, size: 15, color: color),
          if (icon != null) const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: GalleryTextStyles.caption.copyWith(color: color),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (trailing != null) Icon(trailing, size: 14, color: color),
        ],
      ),
    );
  }
}
