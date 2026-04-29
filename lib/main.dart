import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/gallery_app.dart';

export 'app/gallery_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Match the Figma/prototype captures: no Android/iOS host system bars should
  // sit above the authored in-app status bar.
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const GalleryPrototypeApp());
}
