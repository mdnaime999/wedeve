import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../config/fields/input.field.dart';
import '../controllers/auth.cont.dart';
import '../route/routes.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
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
              SvgPicture.asset("assets/logo.svg"),
              SizedBox(height: 8.h),
              Text(
                "Sign In",
                style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 3.h),
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
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Icon(Icons.visibility_off),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black45),
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: GoogleFonts.roboto(
                      color: Colors.grey,
                    ),
                  )
                ],
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
                  child: Text("Login"),
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
              SizedBox(height: 7.h),
              InkWell(
                onTap: () => Get.toNamed(AuthRoutes.signup),
                child: Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Text(
                    "Create New Account",
                    style: GoogleFonts.roboto(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
