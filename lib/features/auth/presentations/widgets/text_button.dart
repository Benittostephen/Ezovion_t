import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          color: Colors.grey[900],
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
