import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/feature/profile/presentation/profile_page/widgets/manage_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAlertDiolg extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onPressedNo;
  const CustomAlertDiolg({
    super.key,
    this.onPressed,
    this.onPressedNo,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(32, 32, 32, 28),
      actionsPadding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      insetPadding: const EdgeInsets.all(20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      surfaceTintColor: Colors.white,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
      title: const Text(
        'Are you sure you wanna leave?',
        textAlign: TextAlign.center,
      ),
      actions: [
        SizedBox(
          width: 135,
          child: ManageButton(
            onPressed: onPressed,
            color: AppColors.beige,
            textColor: Colors.black,
            child: const Text('Yes'),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 135,
          child: ManageButton(
            onPressed: onPressedNo,
            child: const Text('No'),
          ),
        ),
      ],
    );
  }
}
