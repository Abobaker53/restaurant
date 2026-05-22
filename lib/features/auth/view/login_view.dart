import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/core/app_manager/app_colors.dart';
import 'package:restaurant/core/app_manager/app_images.dart';
import 'package:restaurant/core/components/custom_svg.dart';
import 'package:restaurant/core/components/custom_text_field.dart';
import 'package:restaurant/core/helper/custom_Snack_bar.dart';
import 'package:restaurant/features/auth/cubit/login/login_State.dart';
import 'package:restaurant/features/auth/cubit/login/login_cubit.dart';

import '../../../core/components/custom_btn.dart';
import '../../../core/helper/custom_navigator.dart';
import '../../home/view/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Builder(
          builder: (context) {
            var cubit = LoginCubit.get(context);
            return SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: CustomSvg(imagePath: AppImages.backIcon),
                      ),
                      SizedBox(width: 119.w),
                      Text(
                        "Hello!",
                        style: GoogleFonts.leagueSpartan(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: AppColors.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60.h),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: Container(
                        width: double.infinity,
                        color: AppColors.white,
                        child: Form(
                          key: cubit.formKey,
                          child: Padding(
                            padding: REdgeInsets.all(30.0),
                            child: SingleChildScrollView(
                              child: Column(
                              
                                children: [
                                  Align(
                                    alignment: AlignmentGeometry.topStart,
                                    child: Text(
                                      "Welcome",
                                      style: GoogleFonts.leagueSpartan(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 52.h),
                                  CustomTextField(
                                    validator: (String? value) {
                                      // using regex
                                      var emailRegex = RegExp(
                                        r"^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$",
                                      );
                                      if (!emailRegex.hasMatch(value ?? '')) {
                                        return "Invalid Email";
                                      }
                                      return null;
                                    },
                                    hintText: "Enter Email here",
                                    controller: cubit.email,
                                    title: "Email",
                                  ),
                                  SizedBox(height: 22.h),
                                  CustomTextField(
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Required Field";
                                      } else if (value.length < 6) {
                                        return "Password Must be 6 characters or more";
                                      }
                              
                                      return null;
                                    },
                                    obscureText: true,
                                    hintText: "Enter Password here",
                                    controller: cubit.password,
                                    title: "Password",
                                  ),
                                  SizedBox(height: 60.h,),
                                  BlocConsumer<LoginCubit, LoginState>(
                                    listener: (context, state) {
                                      if (state is LoginErrorState) {
                                        CustomSnackBar.showSnackBar(
                                          context,
                                          state.error,
                                          SnackBarState.error,
                                        );
                                      } else if (state is LoginSuccessState) {
                                        CustomSnackBar.showSnackBar(
                                          context,
                                          'Login Success\nWelcome ${state.userModel.name}',
                                          SnackBarState.success,
                                        );
                              
                                        goTo(
                                          context,
                                          HomeView(),
                                          NavigatorType.pushAndRemoveUntil,
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is LoginLoadingState) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.primary,
                                          ),
                                        );
                                      }
                                      return CustomBtn(
                                        text: "Login",
                                        onPressed: cubit.onLoginPressed,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
