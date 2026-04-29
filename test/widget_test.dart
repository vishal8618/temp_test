import 'package:assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the gallery prototype', (WidgetTester tester) async {
    await tester.pumpWidget(const GalleryPrototypeApp());

    expect(find.byType(GalleryPrototype), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);
  });
}
