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

import '../../../config/snackbar/snackbar.dart';
import '../auth/auth.service.dart';
import 'store.service.dart';

class DatabaseService extends GetxService {
  Future<DatabaseService> init() async => this;

  final store = Get.find<StoreService>();
  final authService = Get.find<AuthService>();
  final connect = Get.find<GetConnect>();
}
