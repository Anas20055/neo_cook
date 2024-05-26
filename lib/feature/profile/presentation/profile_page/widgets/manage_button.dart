// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ManageButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? color;
  final Color? textColor;
  const ManageButton({
    super.key,
    this.onPressed,
    required this.child,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          color ?? AppColors.orange,
        ),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
        foregroundColor: MaterialStatePropertyAll(
          textColor ?? Colors.white,
        ),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
