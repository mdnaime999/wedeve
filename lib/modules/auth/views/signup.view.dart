import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart' as badges;

import '../../../app/common/widgets/rich.widget.dart';
import '../../../config/fields/input.field.dart';
import '../controllers/auth.cont.dart';
import '../route/routes.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final AuthController loginCont = Get.find();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.sp),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              badges.Badge(
                position: badges.BadgePosition.custom(bottom: -5, end: 6),
                showBadge: true,
                ignorePointer: false,
                badgeContent: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5.sp),
                  child: Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                    size: 10.sp,
                  ),
                ),
                badgeAnimation: badges.BadgeAnimation.rotation(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.circle,
                  badgeColor: Colors.red,
                  padding: EdgeInsets.all(2.sp),
                ),
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(0, 3),
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.grey,
                    size: 10.w,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              InputFieldOne(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(7.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                controller: null,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Icon(Icons.person_outline),
                ),
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.black45),
              ),
              SizedBox(height: 2.5.h),
              InputFieldOne(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(7.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                controller: loginCont.email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Icon(Icons.mail_outline),
                ),
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.black45),
              ),
              SizedBox(height: 2.5.h),
              InputFieldOne(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(7.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                controller: loginCont.email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Icon(Icons.lock_outline_rounded),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black45),
              ),
              SizedBox(height: 2.5.h),
              InputFieldOne(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(7.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                controller: loginCont.email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Icon(Icons.lock_outline_rounded),
                ),
                hintText: "Confirm Password",
                hintStyle: TextStyle(color: Colors.black45),
              ),
              SizedBox(height: 7.h),
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(7.sp),
                ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15.sp),
                  ),
                  child: Text("Sign Up"),
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset("assets/facebook-logo.svg"),
                  ),
                  SizedBox(width: 5.w),
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset("assets/google-logo.svg"),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              CustomRich(
                first: Text(
                  "Already have an account?",
                  style: GoogleFonts.roboto(
                    color: Colors.black54,
                  ),
                ),
                secend: InkWell(
                  onTap: () => Get.toNamed(AuthRoutes.login),
                  child: Text(
                    "Login",
                    style: GoogleFonts.roboto(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
