// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cook_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;
  const AppTitle({
    super.key,
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: padding,
      color: AppColors.orange,
      child: child,
    );
  }
}
