import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/features/auth/view/login_view.dart';

import '../../../core/app_manager/app_colors.dart';
import '../../../core/app_manager/app_images.dart';
import '../../../core/components/custom_btn.dart';
import '../../../core/components/custom_svg.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/helper/custom_Snack_bar.dart';
import '../../../core/helper/custom_navigator.dart';
import '../cubit/register/register_cubit.dart';
import '../cubit/register/register_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Builder(
          builder: (context) {
            var cubit = RegisterCubit.get(context);
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
                      SizedBox(width: 73.w),
                      Text(
                        "New Account",
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
                            padding:  REdgeInsets.all(35.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  //Full Name
                                  CustomTextField(
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Required Field";
                                      }
                              
                                      return null;
                                    },
                                    hintText: "Enter Full Name here",
                                    controller: cubit.name,
                                    title: "Full Name",
                                  ),
                                  SizedBox(height: 22.h),
                                  //Email
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
                                  //phone
                                  CustomTextField(
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Required Field";
                                      }
                              
                                      return null;
                                    },
                                    hintText: "Enter Mobile Number here",
                                    controller: cubit.phone,
                                    title: "Mobile Number",
                                  ),
                                  //password
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
                                  //confirm password
                                  CustomTextField(
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Required Field";
                                      }
                                      if (value != cubit.password.text) {
                                        return "Passwords do not match";
                                      }
                              
                                      return null;
                                    },
                                    obscureText: true,
                                    hintText: "Confirm Password ",
                                    controller: cubit.confirmPassword,
                                    title: "Confirm Password",
                                  ),
                                  SizedBox(height: 41.h,),
                                  BlocConsumer<RegisterCubit, RegisterState>(
                                    listener: (context, state) {
                                      if (state is RegisterErrorState) {
                                        CustomSnackBar.showSnackBar(
                                          context,
                                          state.error,
                                          SnackBarState.error,
                                        );
                                      } else if (state is RegisterSuccessState) {
                                        CustomSnackBar.showSnackBar(
                                          context,
                                          state.message,
                                          SnackBarState.success,
                                        );
                              
                                        goTo(
                                          context,
                                          LoginView(),
                                          NavigatorType.pushAndRemoveUntil,
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is RegisterLoadingState) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.primary,
                                          ),
                                        );
                                      }
                                      return CustomBtn(
                                        text: "Sign Up",
                                        onPressed: cubit.onRegisterPressed,
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
