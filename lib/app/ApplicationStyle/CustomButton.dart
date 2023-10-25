import 'package:application/app/ApplicationStyle/appcolor.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  CustomButton({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.PrimaryColor),
        minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(50)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
