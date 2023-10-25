import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;

  CustomImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath); // Utilisez Image.asset pour afficher une image depuis les ressources de votre application
  }
}
