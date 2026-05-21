import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/core/app_manager/app_colors.dart';
import 'package:restaurant/core/app_manager/app_images.dart';
import 'package:restaurant/core/helper/custom_navigator.dart';
import 'package:restaurant/features/onboarding/view/onboarding_view.dart';

import '../../../core/components/custom_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      goTo(context, OnboardingView(), NavigatorType.pushAndRemoveUntil);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvg(imagePath: AppImages.appLogo),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "YUM",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                  color: AppColors.primary,
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
        ],
      ),
    );
  }
}
