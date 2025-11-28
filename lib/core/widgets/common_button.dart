import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final bool loading;

  const CommonButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.padding,
    this.borderRadius = 12,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.grey[900],
          foregroundColor: textColor ?? Colors.white,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: loading
              ? SizedBox(
                  key: const ValueKey('loader'),
                  height: fontSize + 4,
                  width: fontSize + 4,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  key: const ValueKey('text'),
                  style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
                ),
        ),
      ),
    );
  }
}
