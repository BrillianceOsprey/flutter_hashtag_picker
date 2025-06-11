import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hashtag_picker/flutter_hashtag_picker.dart';

void main() {
  testWidgets('HashtagPicker shows all hashtags', (WidgetTester tester) async {
    final hashtags = ['Flutter', 'Dart', 'AI'];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HashtagPicker(
            hashtags: hashtags,
            onChanged: (_) {},
          ),
        ),
      ),
    );

    // Verify all hashtags are displayed
    for (final tag in hashtags) {
      expect(find.text('#$tag'), findsOneWidget);
    }
  });
}
