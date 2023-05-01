# Stylish Slider

A highly optimized, dependency-free, and customizable slider for Flutter.

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:stylish_slider/stylish_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stylish Slider')),
        body: StylishSlider(
          slides: [
            Container(color: Colors.red, child: Center(child: Text('Slide 1'))),
            Container(color: Colors.blue, child: Center(child: Text('Slide 2'))),
            Container(color: Colors.green, child: Center(child: Text('Slide 3'))),
            Container(color: Colors.yellow, child: Center(child: Text('Slide 4'))),
          ],
        ),
      ),
    );
  }
}
```
