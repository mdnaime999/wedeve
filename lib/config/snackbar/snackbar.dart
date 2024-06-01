import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SnackbarStyle {
  // Common
  static Color bg = Colors.black54.withOpacity(0.6);
  static Color text = Colors.white;
  // theme
  static Color failureRed = Colors.orange.shade800;
  static Color successGreen = Colors.green.shade300;
  static Color warningYellow = Color(0xffFCA652);
}

class CSnackBar {
  static void errorsSnackBar({
    required BuildContext? context,
    required title,
    required String message,
    int? dur,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: SnackbarStyle.bg,
      titleText: Text(
        title,
        style: GoogleFonts.inter(
          color: SnackbarStyle.text,
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.inter(
          color: SnackbarStyle.text,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      colorText: SnackbarStyle.text,
      borderRadius: 10.sp,
      icon: Icon(
        Icons.error_outline,
        size: 30.sp,
        color: SnackbarStyle.failureRed,
      ),
      shouldIconPulse: true,
      duration: Duration(milliseconds: dur ?? 3000),
    );
  }

  static void successSnackBar({
    required BuildContext? context,
    required title,
    required String message,
    int? dur,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: SnackbarStyle.bg,
      titleText: Text(
        title,
        style: GoogleFonts.inter(
          color: SnackbarStyle.text,
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.inter(
          color: SnackbarStyle.text,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      colorText: SnackbarStyle.text,
      borderRadius: 10.sp,
      icon: Icon(
        Icons.check_circle_outline,
        size: 30.sp,
        color: SnackbarStyle.successGreen,
      ),
      shouldIconPulse: true,
      duration: Duration(milliseconds: dur ?? 3000),
    );
  }
}
