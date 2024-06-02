// ignore_for_file: unused_import, depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;
import 'package:stack_trace/stack_trace.dart';

import '../../../config/diloags/smart.loader.dart';
import '../../../config/snackbar/snackbar.dart';
import '../../../modules/auth/models/login.model.dart';
import '../../common/models/http.headers.dart';
import '../auth/auth.service.dart';
import 'store.service.dart';

class DatabaseService extends GetxService {
  Future<DatabaseService> init() async => this;

  static var client = http.Client();

  Future<MLogin?> login(Map bodyData) async {
    Uri uri = Uri.parse("https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    var responce = await client.post(uri, body: json.encode(bodyData), headers: headers);
    if (responce.statusCode == 200) {
      return mLoginFromJson(responce.body);
    } else {
      CSLoading.dismiss().then((_) {
        CSnackBar.errorsSnackBar(context: Get.context, title: "Attention !!", message: "Login failed");
      });
      print(errorHandle("login", responce.statusCode.toString()));
      return null;
    }
  }

  Future<bool> signup(Map bodyData) async {
    Uri uri = Uri.parse("https://apptest.dokandemo.com/wp-json/wp/v2/users/register");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    var responce = await client.post(uri, body: json.encode(bodyData), headers: headers);
    if (responce.statusCode == 200) {
      return true;
    } else if (responce.statusCode == 400) {
      var data = jsonDecode(responce.body);
      CSLoading.dismiss().then((_) {
        CSnackBar.errorsSnackBar(context: Get.context, title: "Attention!!", message: data['message']);
      });
      return false;
    } else {
      CSLoading.dismiss().then((_) {
        CSnackBar.errorsSnackBar(context: Get.context, title: "Attention !!", message: "Your registration is not successful");
      });
      print(errorHandle("signup", responce.statusCode.toString()));
      return false;
    }
  }

  // ----------------------------------- Error Handle
  String errorHandle(String mathordName, String statusCode) {
    Map returnData = {};
    returnData['page'] = Frame.caller(1).uri.path;
    returnData['mathordName'] = mathordName;
    returnData['statusCode'] = statusCode;

    return jsonEncode(returnData);
  }
}
