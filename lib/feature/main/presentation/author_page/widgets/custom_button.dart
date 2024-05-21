import 'package:cook_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool pressed;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.child,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: pressed
            ? const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10))
            : null,
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
        backgroundColor: MaterialStatePropertyAll(
          pressed ? Colors.transparent : AppColors.orange,
        ),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(
              width: 1,
              color: AppColors.orange,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
