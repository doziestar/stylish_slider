import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stylish_slider/stylish_slider.dart';

void main() {
  testWidgets('Slider package displays slides', (WidgetTester tester) async {
    // Define a test slide
    Widget slide() {
      return Container(
        color: Colors.red,
        child: const Text('Test slide'),
      );
    }

    // Define the slider
    final slider = StylishSlider(
      slides: [slide(), slide(), slide()],
    );

    // Build the slider in the test environment
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: slider,
        ),
      ),
    );

    // Check that the slider displays the correct number of slides
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.text('Test slide'), findsNWidgets(3));
  });
}
