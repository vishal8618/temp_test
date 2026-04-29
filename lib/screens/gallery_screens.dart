import 'package:flutter/material.dart';

import '../theme/gallery_theme.dart';
import '../widgets/gallery_widgets.dart';

class HomePhotoScreen extends StatelessWidget {
  const HomePhotoScreen({
    required this.selectedPhoto,
    required this.favorite,
    required this.onBack,
    required this.onMore,
    required this.onFavorite,
    required this.onSelectPhoto,
    super.key,
  });

  final int selectedPhoto;
  final bool favorite;
  final VoidCallback onBack;
  final VoidCallback onMore;
  final VoidCallback onFavorite;
  final ValueChanged<int> onSelectPhoto;

  @override
  Widget build(BuildContext context) {
    return GalleryFrame(
      child: Stack(
        children: [
          const Positioned.fill(
            child: PhotoBackground(asset: GalleryAssets.lake),
          ),
          const Positioned.fill(child: ScreenScrim()),
          const Positioned(top: 26, left: 45, right: 38, child: IosStatusBar()),
          Positioned(
            top: 78,
            left: 22,
            right: 22,
            child: Row(
              children: [
                CircleGlassButton(
                  icon: Icons.chevron_left_rounded,
                  onTap: onBack,
                ),
                const SizedBox(width: 27),
                const Expanded(
                  child: GlassPill(
                    height: 44,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Home',
                          style: TextStyle(
                            color: GalleryPalette.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'October 29, 2026, 08:08  1:30 PM',
                          style: TextStyle(
                            color: GalleryPalette.white,
                            fontSize: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 27),
                CircleGlassButton(
                  icon: Icons.more_horiz_rounded,
                  onTap: onMore,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 126,
            child: ThumbnailStrip(
              selectedIndex: selectedPhoto,
              onSelect: onSelectPhoto,
            ),
          ),
          Positioned(
            left: 28,
            right: 28,
            bottom: 68,
            child: PhotoActionBar(favorite: favorite, onFavorite: onFavorite),
          ),
        ],
      ),
    );
  }
}

class MapSearchScreen extends StatelessWidget {
  const MapSearchScreen({
    required this.query,
    required this.onQueryChanged,
    super.key,
  });

  final String query;
  final ValueChanged<String> onQueryChanged;

  void _handleKey(String key) {
    if (key == 'backspace') {
      if (query.isNotEmpty) {
        onQueryChanged(query.substring(0, query.length - 1));
      }
      return;
    }
    onQueryChanged('$query$key');
  }

  @override
  Widget build(BuildContext context) {
    return GalleryFrame(
      child: Stack(
        children: [
          const Positioned.fill(
            child: PhotoBackground(asset: GalleryAssets.map),
          ),
          const Positioned.fill(child: MapTint()),
          const Positioned(top: 26, left: 45, right: 38, child: IosStatusBar()),
          const Positioned(
            top: 76,
            left: 0,
            right: 0,
            child: Center(child: Text('Map', style: GalleryTextStyles.title)),
          ),
          const Positioned(
            top: 74,
            left: 22,
            child: CircleGlassButton(icon: Icons.chevron_left_rounded),
          ),
          const Positioned(
            top: 126,
            left: 12,
            child: PhotoChip(asset: GalleryAssets.lake, label: '36'),
          ),
          const Positioned(
            right: 35,
            top: 300,
            child: PhotoChip(asset: GalleryAssets.boat, label: '472'),
          ),
          const Positioned(
            left: 72,
            top: 350,
            child: SuggestionsMenu(
              items: ['Apple', 'App Logos', 'Apple Watch'],
            ),
          ),
          Positioned(
            left: 12,
            right: 12,
            bottom: 222,
            child: SearchField(text: query, onChanged: onQueryChanged),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FakeKeyboard(onKey: _handleKey),
          ),
        ],
      ),
    );
  }
}

class PhotoDetailMenuScreen extends StatelessWidget {
  const PhotoDetailMenuScreen({
    required this.favorite,
    required this.onFavorite,
    super.key,
  });

  final bool favorite;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return GalleryFrame(
      child: Stack(
        children: [
          const Positioned.fill(child: ColoredBox(color: GalleryPalette.black)),
          const Positioned(top: 26, left: 45, right: 38, child: IosStatusBar()),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 350,
            child: Image.asset(GalleryAssets.boat, fit: BoxFit.cover),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 350,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
          ),
          const Positioned(left: 18, top: 330, child: AvatarRow()),
          const Positioned(
            left: 72,
            right: 72,
            top: 372,
            child: DetailPopupMenu(),
          ),
          const Positioned(
            left: 16,
            right: 16,
            top: 500,
            child: PhotoMetaBlock(),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            height: 205,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(GalleryRadius.md),
              child: Image.asset(GalleryAssets.map, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 28,
            right: 28,
            bottom: 36,
            child: PhotoActionBar(favorite: favorite, onFavorite: onFavorite),
          ),
        ],
      ),
    );
  }
}

class DetailPopupMenu extends StatelessWidget {
  const DetailPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const rows = [
      (Icons.photo_library_outlined, 'All Photos'),
      (Icons.vpn_key_outlined, 'Make Key Photo'),
      (Icons.badge_outlined, 'Edit Name & Photo'),
      (Icons.delete_outline_rounded, "Don't Feature This Person"),
    ];

    return GlassCard(
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            MenuRow(icon: rows[i].$1, label: rows[i].$2, red: i == 3),
            if (i != rows.length - 1)
              const Divider(height: 1, color: GalleryPalette.divider),
          ],
        ],
      ),
    );
  }
}

class CollectionsGridScreen extends StatelessWidget {
  const CollectionsGridScreen({
    required this.selectedTab,
    required this.onToggleLayout,
    required this.onTabChanged,
    super.key,
  });

  final String selectedTab;
  final VoidCallback onToggleLayout;
  final ValueChanged<String> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return GalleryFrame(
      child: Stack(
        children: [
          const Positioned.fill(child: FrostedGalleryBackdrop()),
          const Positioned(top: 26, left: 45, right: 38, child: IosStatusBar()),
          const Positioned(
            top: 76,
            left: 16,
            right: 16,
            child: CollectionsHeader(menuOpen: true),
          ),
          const Positioned(top: 150, left: 16, right: 16, child: PeoplePets()),
          const Positioned(top: 310, left: 16, right: 16, child: MemoryRow()),
          const Positioned(
            top: 438,
            left: 16,
            right: 16,
            child: MemoryRow(title: 'Pinned'),
          ),
          const Positioned(top: 566, left: 16, right: 16, child: FeatureRow()),
          Positioned(
            top: 110,
            left: 150,
            child: ViewOptionsMenu(onCollapse: onToggleLayout),
          ),
          Positioned(
            left: 22,
            right: 22,
            bottom: 28,
            child: LibraryBottomBar(
              selectedTab: selectedTab,
              onTabChanged: onTabChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class CollectionsListScreen extends StatelessWidget {
  const CollectionsListScreen({
    required this.selectedTab,
    required this.onToggleLayout,
    required this.onTabChanged,
    super.key,
  });

  final String selectedTab;
  final VoidCallback onToggleLayout;
  final ValueChanged<String> onTabChanged;

  @override
  Widget build(BuildContext context) {
    final rows = [
      'Memories',
      'Pinned',
      'Featured Photos',
      'People & Pets',
      'People & Pets',
      'People & Pets',
      'Memories',
      'Pinned',
      'Featured Photos',
      'People & Pets',
    ];

    return GalleryFrame(
      child: Stack(
        children: [
          const Positioned.fill(child: ColoredBox(color: GalleryPalette.black)),
          const Positioned(top: 26, left: 45, right: 38, child: IosStatusBar()),
          const Positioned(
            top: 76,
            left: 16,
            right: 16,
            child: CollectionsHeader(menuOpen: false),
          ),
          Positioned(
            top: 166,
            left: 16,
            right: 16,
            bottom: 78,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: rows.length,
              separatorBuilder: (_, _) =>
                  const Divider(height: 1, color: GalleryPalette.divider),
              itemBuilder: (context, index) => CollectionListTile(rows[index]),
            ),
          ),
          Positioned(
            left: 22,
            right: 22,
            bottom: 28,
            child: LibraryBottomBar(
              selectedTab: selectedTab,
              onTabChanged: onTabChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumGridScreen extends StatelessWidget {
  const AlbumGridScreen({required this.selectedTab, super.key});

  final String selectedTab;

  @override
  Widget build(BuildContext context) {
    return GalleryFrame(
      child: Stack(
        children: [
          const Positioned.fill(child: FrostedGalleryBackdrop()),
          const Positioned(top: 26, left: 45, right: 38, child: IosStatusBar()),
          Positioned(
            top: 74,
            left: 16,
            right: 16,
            child: Row(
              children: [
                const CircleGlassButton(icon: Icons.chevron_left_rounded),
                const SizedBox(width: 34),
                const Expanded(
                  child: Text(
                    'Best Shots',
                    textAlign: TextAlign.center,
                    style: GalleryTextStyles.title,
                  ),
                ),
                const SizedBox(width: 12),
                GlassIconButton(icon: Icons.add_rounded, onTap: () {}),
                const SizedBox(width: 8),
                GlassIconButton(icon: Icons.more_horiz_rounded, onTap: () {}),
              ],
            ),
          ),
          const Positioned(top: 145, left: 16, right: 16, child: AlbumGrid()),
          const Positioned(top: 118, right: 20, child: AlbumSortMenu()),
          Positioned(
            left: 22,
            right: 22,
            bottom: 28,
            child: LibraryBottomBar(
              selectedTab: selectedTab,
              onTabChanged: (_) {},
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumSortMenu extends StatelessWidget {
  const AlbumSortMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassCard(
      width: 145,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MenuRow(icon: Icons.check_rounded, label: 'Sort by Date Modified'),
          MenuRow(label: 'Sort by Name'),
          MenuRow(label: 'Sort by Custom Order'),
          Divider(height: 1, color: GalleryPalette.divider),
          MenuRow(label: 'Edit Title & Albums'),
          MenuRow(
            label: 'Remove from Folder',
            trailing: Icons.chevron_right_rounded,
          ),
          MenuRow(
            label: 'Delete Folder',
            red: true,
            trailing: Icons.delete_outline_rounded,
          ),
        ],
      ),
    );
  }
}

class MemoryMovieScreen extends StatelessWidget {
  const MemoryMovieScreen({
    required this.query,
    required this.onQueryChanged,
    super.key,
  });

  final String query;
  final ValueChanged<String> onQueryChanged;

  void _handleKey(String key) {
    if (key == 'backspace') {
      if (query.isNotEmpty) {
        onQueryChanged(query.substring(0, query.length - 1));
      }
      return;
    }
    onQueryChanged('$query$key');
  }

  @override
  Widget build(BuildContext context) {
    return GalleryFrame(
      child: Stack(
        children: [
          const Positioned.fill(child: BlurredColorBackdrop()),
          const Positioned(top: 26, left: 45, right: 38, child: IosStatusBar()),
          const Positioned(
            top: 74,
            left: 22,
            child: CircleGlassButton(icon: Icons.chevron_left_rounded),
          ),
          Positioned(
            top: 176,
            left: 12,
            right: 12,
            child: Container(
              height: 96,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: Colors.white54, width: 0.8),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Create a\nMemory Movie',
                textAlign: TextAlign.center,
                style: GalleryTextStyles.title,
              ),
            ),
          ),
          const Positioned(left: 24, right: 24, top: 356, child: PromptList()),
          Positioned(
            left: 12,
            right: 12,
            bottom: 222,
            child: SearchField(
              text: query,
              microphone: true,
              onChanged: onQueryChanged,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FakeKeyboard(onKey: _handleKey),
          ),
        ],
      ),
    );
  }
}
