// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:wedevs/modules/auth/models/login.model.dart';
// ignore: unused_import
import 'dart:developer' as dev;

import '../../../app/services/auth/auth.service.dart';
import '../../../app/services/database/database.service.dart';
import '../../../app/services/database/store.service.dart';
import '../../../config/diloags/smart.loader.dart';
import '../../../config/snackbar/snackbar.dart';
import '../../home/route/routes.dart';
import '../route/routes.dart';

class AuthController extends GetxController {
  final as = Get.find<AuthService>();
  final ss = Get.find<StoreService>();
  final dbs = Get.find<DatabaseService>();

  // -------------------- variavles
  RxBool loadWindow = false.obs;

  //  -------------------- Login Variable
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  RxBool loginPassShow = true.obs;
  RxBool signupButton = false.obs;

  @override
  void onInit() async {
    super.onInit();
    Future.delayed(Duration(seconds: 2)).then((value) {
      loadWindow.value = true;
      FlutterNativeSplash.remove();
    });
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
    if (name.text.isEmpty) {
      CSLoading.dismiss();
      CSnackBar.errorsSnackBar(context: Get.context, title: "Field Error!!", message: "Name can't be empty");
    } else {
      validation().then((validat) {
        if (validat) {
          getSignupUsers();
        }
      });
    }
  }

  // ------------------------------------------ Local login db query
  Future<void> getLoginUsers() async {
    Map sendData = {};
    sendData["username"] = email.text;
    sendData["password"] = password.text;
    dbs.login(sendData).then((returnData) {
      CSLoading.dismiss();
      if (returnData != null) {
        ss.db.write('auth', mLoginToJson(returnData)).then((_) {
          print("---- go to home (Login) ----");
          as.authCheck().then((__) {
            CSnackBar.successSnackBar(context: Get.context, title: "Success!", message: "Your are login successfully");
            Get.offAllNamed(HomeRoutes.home);
          });
        });
      }
    });
  }

  // ------------------------------------------ Local Signup db query
  Future<void> getSignupUsers() async {
    Map sendData = {};
    sendData["username"] = name.text;
    sendData["email"] = email.text;
    sendData["password"] = password.text;
    dbs.signup(sendData).then((returnData) {
      CSLoading.dismiss();
      if (returnData) {
        CSnackBar.successSnackBar(context: Get.context, title: "Success", message: "Your registration is successful");
        Get.toNamed(AuthRoutes.login);
      }
    });
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

  Future<void> fildChange() async {
    if (password.text != cPassword.text) {
      signupButton.value = false;
    } else {
      signupButton.value = true;
    }
  }

  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email.text);
  }
}
