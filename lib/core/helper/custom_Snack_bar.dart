import 'package:flutter/material.dart';

enum SnackBarState { success, error, warning, info }

abstract class CustomSnackBar {
  static void showSnackBar(context, String message, SnackBarState state) {
    Color backgroundColor;
    switch (state) {
      case SnackBarState.success:
        backgroundColor = Colors.green;
      case SnackBarState.error:
        backgroundColor = Colors.red;
      case SnackBarState.warning:
        backgroundColor = Colors.yellow;
      case SnackBarState.info:
        backgroundColor = Colors.blue;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(16),
      ),
    );
  }
}