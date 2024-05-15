import 'package:flutter/material.dart';

abstract class CustomSnackBar {
  static SnackBar customSnackBar({
    Color color = Colors.red,
    required String text,
  }) {
    return SnackBar(
      shape: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(color: color),
      ),
      content: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.white,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 16,
        right: 16,
      ),
    );
  }
}
