import 'dart:async';

import 'package:animations_hw/views/screens/second_task/widgets/image_container.dart';
import 'package:flutter/material.dart';

class SecondTask extends StatefulWidget {
  const SecondTask({super.key});

  @override
  State<SecondTask> createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    'https://via.placeholder.com/600/92c952',
    'https://via.placeholder.com/600/771796',
    'https://via.placeholder.com/600/24f355',
    'https://via.placeholder.com/600/d32776',
    'https://via.placeholder.com/600/f66b97',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (_currentPage < _images.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
        title: const Text('Second task'),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) => ImageContainer(
              imagePath: _images[index],
            ),
          ),
        ),
      ),
    );
  }
}
