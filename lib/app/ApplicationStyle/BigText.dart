import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
   
  final Color textColor;

  BigText({required this.text, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textColor, // Utilisez la couleur fournie
      ),
    );
  }
  
}
