import 'dart:async';

import 'package:flutter/material.dart';

class StylishSlider extends StatefulWidget {
  final List<Widget> slides;
  final Duration autoPlayDuration;

  StylishSlider({
    required this.slides,
    this.autoPlayDuration = const Duration(seconds: 5),
  });

  @override
  _StylishSliderState createState() => _StylishSliderState();
}

class _StylishSliderState extends State<StylishSlider> {
  late PageController _pageController;
  late Timer _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 5000);
    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer.cancel();
    _autoPlayTimer = Timer(widget.autoPlayDuration, _nextSlide);
  }

  void _previousSlide() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _startAutoPlay();
  }

  void _nextSlide() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _startAutoPlay();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => _startAutoPlay(),
            itemBuilder: (context, index) =>
                widget.slides[index % widget.slides.length],
            itemCount: widget.slides.length * 10000,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: _previousSlide,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: _nextSlide,
          ),
        ),
      ],
    );
  }
}
