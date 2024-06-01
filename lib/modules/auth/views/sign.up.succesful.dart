import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SignUpSuccessful extends StatelessWidget {
  const SignUpSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10.sp),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFF5EEEE),
                            blurRadius: 5,
                            spreadRadius: 0.5,
                            offset: Offset(3, 3),
                          ),
                          BoxShadow(
                            color: Color(0xFFF3E9E9),
                            blurRadius: 5,
                            spreadRadius: 0.5,
                            offset: Offset(-3, -3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.done),
                          SizedBox(height: 2.h),
                          Text(
                            "Your email address has been verified.!",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: Color(0xFF0C85EA),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "You have successfully verified your email address.",
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: Color(0xFF6B7280),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.h),
                    SizedBox(
                      // width: 100.w,
                      child: TextButton(
                        onPressed: () {
                          // Get.offAllNamed(AuthRoutes.login);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 60.sp),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp)),
                          textStyle: GoogleFonts.inter(fontSize: 12.sp),
                        ),
                        child: Text(
                          "Get started",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
