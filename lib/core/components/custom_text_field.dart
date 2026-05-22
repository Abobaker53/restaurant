import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/core/app_manager/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    required this.controller,
    this.validator,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    required this.title,
  });

  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool enabled;
  final bool readOnly;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.leagueSpartan(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly,
          validator: validator,
          controller: controller,
          style: GoogleFonts.leagueSpartan(
            fontSize: 20,
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
          ),
          obscureText: obscureText,
          obscuringCharacter: '*',
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.yello,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.white, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.yello, width: 1),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.leagueSpartan(
              color: Color(0xff6E6A7C),
              fontSize: 14,
              fontWeight: FontWeight.w100,
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
