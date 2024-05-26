// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cook_app/core/constants/app_colors.dart';

class MyTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onPressed;
  final bool obscure;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final EdgeInsets? padding;
  final int? minLines;
  final double? radius;
  final TextStyle? style;

  const MyTextField({
    super.key,
    this.validator,
    required this.hintText,
    required this.controller,
    this.onPressed,
    this.obscure = false,
    this.onChanged,
    this.suffixIcon,
    this.padding,
    this.minLines,
    this.radius,
    this.style,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorErrorColor: Colors.black,
      cursorColor: Colors.black,
      style: style ?? Theme.of(context).textTheme.labelSmall,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 42),
          borderSide: BorderSide.none,
        ),
        fillColor: AppColors.backGrey,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 42),
          borderSide: const BorderSide(
            color: Colors.orange,
            width: 1.1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 42),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 42),
          borderSide: const BorderSide(
            color: Colors.orange,
            width: 1.1,
          ),
        ),
        errorStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Colors.red,
        ),
        contentPadding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 9,
            ),
        hintText: hintText,
        hintStyle: style?.copyWith(color: AppColors.grey) ??
            Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.grey,
                ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      controller: controller,
      obscureText: obscure,
      obscuringCharacter: '*',
      minLines: minLines ?? 1,
      maxLines: 2,
    );
  }
}
