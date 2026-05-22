import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/core/app_manager/app_colors.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.onPressed,
    required this.text,
    this.isSecond = false,
    this.isWhite = false,
    this.isPrimary = false,
  });

  final void Function() onPressed;
  final String text;

  final bool isSecond;
  final bool isWhite;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),

        backgroundColor: isSecond
            ? AppColors.scaffoldBackground
            : isWhite
            ? AppColors.yello
            : AppColors.primary,
        fixedSize: Size(200, 45),
      ),
      onPressed: onPressed,

      child: Text(
        text,
        style: GoogleFonts.leagueSpartan(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: isPrimary ? AppColors.primary : AppColors.white,
        ),
      ),
    );
  }
}
