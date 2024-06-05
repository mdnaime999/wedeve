import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../modules/auth/route/routes.dart';
import '../modules/home/route/routes.dart';
import '../modules/profile/route/routes.dart';
import 'diloags/body.dialog.dart';

String appName = "Dokan";

// GetStorage db = GetStorage('store');
// ============= app modules
List modules = [
  HomeRoutes.routes,
  AuthRoutes.routes,
  ProfileRoutes.routes,
];

class AppSettings {}

Future<bool> appClose() async {
  Get.dialog(
    ShowDialogWithBody(
      title: "Attention please !!",
      body: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Text(
          "Do you want to close this app ?",
          style: GoogleFonts.openSans(
            color: Colors.black54,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      submitText: "Close",
      cancelText: "No",
      submitFun: () async {
        Get.back();
        Get.offAllNamed(HomeRoutes.home);
      },
    ),
    barrierDismissible: false,
  );
  return false;
}
