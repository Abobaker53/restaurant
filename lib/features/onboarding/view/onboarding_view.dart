import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/core/app_manager/app_colors.dart';
import 'package:restaurant/core/app_manager/app_images.dart';
import 'package:restaurant/core/components/custom_svg.dart';
import 'package:restaurant/features/onboarding/view/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/helper/custom_navigator.dart';
import '../data/repo/onboarding_repo.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: PageView.builder(
        controller: controller,
        itemCount: OnboardingRepo.onBoardingList.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned(
                top: 32,
                child: Image.asset(
                  OnboardingRepo.onBoardingList[index].image,
                  fit: BoxFit.cover,
                ),
              ),
              if (currentPage != OnboardingRepo.onBoardingList.length - 1)
              Positioned(
                top: 53.h,
                right: 35.w,
                child: GestureDetector(
                  onTap: (){
                    goTo(
                      context,
                      WelcomeView(),
                      NavigatorType.pushAndRemoveUntil,
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        "Skip",
                        style: GoogleFonts.leagueSpartan(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.primary
                        ),
                      ),
                      SizedBox(width: 9.w,),
                      CustomSvg(
                        imagePath: AppImages.nextIcon,
                        height: 13.h,
                        width: 8.w,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 514.h,
                child: Container(
                  height: 338.h,
                  width: 393.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 23.h),
                      CustomSvg(
                        imagePath: OnboardingRepo.onBoardingList[index].icon,
                      ),
                      SizedBox(height: 20),
                      Text(
                        OnboardingRepo.onBoardingList[index].text,
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 92),
                      SmoothPageIndicator(
                        controller: controller,
                        count: OnboardingRepo.onBoardingList.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.primary,
                          dotColor: AppColors.yello,
                          expansionFactor: 1.5,
                          dotHeight: 4,
                          dotWidth: 20,
                          radius: 2,
                          spacing: 4,
                        ),
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(100),
                          ),
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          fixedSize: Size(133, 36),
                        ),
                        onPressed: () {
                          if (currentPage <
                              OnboardingRepo.onBoardingList.length - 1) {
                            controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            goTo(
                              context,
                              WelcomeView(),
                              NavigatorType.pushAndRemoveUntil,
                            );
                          }
                        },

                        child: Text(
                          currentPage ==
                                  OnboardingRepo.onBoardingList.length - 1
                              ? "Get Started"
                              : "Next",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
