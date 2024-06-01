// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'dart:developer' as dev;

import '../../../app/services/auth/auth.service.dart';
import '../../../app/services/database/database.service.dart';
import '../../../app/services/database/store.service.dart';
import '../../../config/diloags/smart.loader.dart';
import '../../../config/snackbar/snackbar.dart';

class AuthController extends GetxController {
  final as = Get.find<AuthService>();
  final ss = Get.find<StoreService>();
  final dbs = Get.find<DatabaseService>();

  // -------------------- variavles
  RxInt page = 1.obs;

  //  -------------------- Login Variable
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool loginKeep = false.obs;
  RxBool loginPassShow = true.obs;
  RxBool signupTerms = false.obs;
  RxBool signupPassShow = true.obs;

  @override
  void onInit() async {
    super.onInit();
    Future.delayed(Duration(seconds: 2)).then((value) => FlutterNativeSplash.remove());
  }

  // ------------------------------------------ Local login action
  Future<void> localLogin() async {
    CSLoading.start();
    validation().then((validat) {
      if (validat) {
        getLoginUsers();
      }
    });
  }

  // ------------------------------------------ Local signup action
  Future<void> localSignUp() async {
    CSLoading.start();
    if (fullName.text.isEmpty) {
      CSLoading.dismiss();
      CSnackBar.errorsSnackBar(context: Get.context, title: "Field Error!!", message: "Full name can't be empty");
    } else {
      validation().then((validat) {
        if (!validat) {
        } else if (!signupTerms.value) {
          CSLoading.dismiss();
          CSnackBar.errorsSnackBar(context: Get.context, title: "Field Error!!", message: "Please accept the terms and conditions.");
        } else {
          getSignupUsers();
        }
      });
    }
  }

  // ------------------------------------------ Local login db query
  Future<void> getLoginUsers() async {
    Map<String, dynamic> variables = {
      "email": email.text,
      "password": password.text
    };
    // await dbs.authMutation(loginQuery, variables).then((result) {
    //   CSLoading.dismiss();
    //   if (result != null) {
    //     String createJson = jsonEncode(result);
    //     ss.db.write('auth', createJson).then((_) {
    //       print("---- go to home (Login) ----");
    //       as.authCheck().then((__) {
    //         CSnackBar.successSnackBar(context: Get.context, title: "Success!", message: "Your are login successfully");
    //         Get.offAllNamed(HomeRoutes.home);
    //       });
    //     });
    //   }
    // });
  }

  // ------------------------------------------ Local Signup db query
  Future<void> getSignupUsers() async {
    Map<String, dynamic> variables = {
      "name": fullName.text,
      "email": email.text,
      "password": password.text
    };
    // await dbs.authMutation(registerQuery, variables).then((result) {
    //   CSLoading.dismiss();
    //   if (result != null) {
    //     String createJson = jsonEncode(result);
    //     ss.db.write('auth', createJson).then((_) {
    //       print("---- go to home (Register) ----");
    //       as.authCheck().then((__) {
    //         CSnackBar.successSnackBar(context: Get.context, title: "Success!", message: "Your are registration and login successfully");
    //         Get.offAllNamed(HomeRoutes.home);
    //       });
    //     });
    //   }
    // });
  }

  // ------------------------------------------ Field Validations
  Future<bool> validation() async {
    if (email.text.isEmpty) {
      CSLoading.dismiss();
      CSnackBar.errorsSnackBar(context: Get.context, title: "Field Error!!", message: "Email can't be empty");
      return false;
    } else if (!isValidEmail()) {
      CSLoading.dismiss();
      CSnackBar.errorsSnackBar(context: Get.context, title: "Field Error!!", message: "Please enter a valid Email");
      return false;
    } else if (password.text.isEmpty) {
      CSLoading.dismiss();
      CSnackBar.errorsSnackBar(context: Get.context, title: "Field Error!!", message: "Password can't be empty");
      return false;
    } else if (password.text.length < 6) {
      CSLoading.dismiss();
      CSnackBar.errorsSnackBar(context: Get.context, title: "Field Error!!", message: "Password must be at least 6 characters");
      return false;
    } else {
      return true;
    }
  }

  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email.text);
  }
}
