import 'package:ezovion_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool enabled;
  final int? maxLines;
  final String? hintText;

  const CommonTextField({
    super.key,
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
    this.maxLines = 1,
    this.hintText,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: TextStyle(color: AppColors.accent1),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: AppColors.accent1, size: 20)
            : null,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: Colors.grey.shade500,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.accent1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.accent1, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.accent1, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
