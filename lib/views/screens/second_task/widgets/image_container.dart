import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath;

  const ImageContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Image.network(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
