import 'package:cook_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onPressed;
  final bool obscure;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscure = false,
    this.validator,
    this.onChanged,
    this.onPressed,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorErrorColor: Colors.black,
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.labelSmall,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(42),
          borderSide: BorderSide.none,
        ),
        fillColor: AppColors.backGrey,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(42),
          borderSide: const BorderSide(
            color: Colors.orange,
            width: 1.1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(42),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(42),
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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 19,
          vertical: 9,
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.grey,
            ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      controller: controller,
      obscureText: obscure,
      obscuringCharacter: '*',
    );
  }
}
