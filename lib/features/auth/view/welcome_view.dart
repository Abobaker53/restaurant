import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/core/app_manager/app_colors.dart';
import 'package:restaurant/core/app_manager/app_images.dart';
import 'package:restaurant/core/components/custom_btn.dart';
import 'package:restaurant/core/components/custom_svg.dart';
import 'package:restaurant/core/helper/custom_navigator.dart';
import 'package:restaurant/features/auth/view/login_view.dart';
import 'package:restaurant/features/auth/view/register_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvg(imagePath: AppImages.appLogo, color: AppColors.yello),
          SizedBox(height: 26.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "YUM",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                  color: AppColors.scaffoldBackground,
                ),
              ),
              Text(
                "QUICK",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 100.h),
          CustomBtn(
            onPressed: () {
              goTo(context, LoginView());
            },
            isSecond: true,
            isPrimary: true,
            text: "Log In",
          ),
          SizedBox(height: 4.h),
          CustomBtn(
            onPressed: () {
              goTo(context, RegisterView());
            },
            isWhite: true,
            isPrimary: true,

            text: "Sign Up",
          ),
        ],
      ),
    );
  }
}
