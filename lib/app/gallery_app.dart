import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../design/design_constants.dart';
import '../screens/gallery_screens.dart';
import '../theme/gallery_theme.dart';

class GalleryPrototypeApp extends StatelessWidget {
  const GalleryPrototypeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Figma Dev Mode frame: width 402px, height 874px.
      designSize: const Size(FigmaFrame.width, FigmaFrame.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'AI Gallery App',
          debugShowCheckedModeBanner: false,
          theme: GalleryTheme.dark,
          home: child,
        );
      },
      child: const GalleryPrototype(),
    );
  }
}

/// Top-level prototype navigator.
///
/// The Figma prototype uses seven frames. A [PageView] keeps that interaction
/// model intact while each page remains a real Flutter widget tree.
class GalleryPrototype extends StatefulWidget {
  const GalleryPrototype({super.key});

  @override
  State<GalleryPrototype> createState() => _GalleryPrototypeState();
}

class _GalleryPrototypeState extends State<GalleryPrototype> {
  final _pageController = PageController();

  int _page = 0;
  int _selectedPhoto = 3;
  String _mapQuery = 'app';
  String _memoryQuery = 'Discribe a memory';
  bool _favorite = false;
  bool _showGridCollections = true;
  String _selectedCollectionTab = 'Library';

  void _goTo(int page) {
    _pageController.animateToPage(
      page.clamp(0, 6),
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePhotoScreen(
        selectedPhoto: _selectedPhoto,
        favorite: _favorite,
        onBack: () => _goTo(0),
        onMore: () => _goTo(2),
        onFavorite: () => setState(() => _favorite = !_favorite),
        onSelectPhoto: (index) => setState(() => _selectedPhoto = index),
      ),
      MapSearchScreen(
        query: _mapQuery,
        onQueryChanged: (value) => setState(() => _mapQuery = value),
      ),
      PhotoDetailMenuScreen(
        favorite: _favorite,
        onFavorite: () => setState(() => _favorite = !_favorite),
      ),
      CollectionsGridScreen(
        selectedTab: _selectedCollectionTab,
        onToggleLayout: () => setState(() => _showGridCollections = false),
        onTabChanged: (tab) => setState(() => _selectedCollectionTab = tab),
      ),
      CollectionsListScreen(
        selectedTab: _selectedCollectionTab,
        onToggleLayout: () => setState(() => _showGridCollections = true),
        onTabChanged: (tab) => setState(() => _selectedCollectionTab = tab),
      ),
      AlbumGridScreen(selectedTab: _selectedCollectionTab),
      MemoryMovieScreen(
        query: _memoryQuery,
        onQueryChanged: (value) => setState(() => _memoryQuery = value),
      ),
    ];

    return Scaffold(
      backgroundColor: GalleryPalette.black,
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (page) => setState(() => _page = page),
        itemBuilder: (context, index) {
          final adjustedIndex = !_showGridCollections && index == 3 ? 4 : index;
          return Stack(
            children: [
              pages[adjustedIndex],
              Positioned(
                right: 18,
                bottom: 18,
                child: Offstage(
                  offstage: true,
                  child: Text('Frame ${_page + 1}'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
