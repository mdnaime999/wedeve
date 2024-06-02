import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'auth/auth.service.dart';
import 'database/database.service.dart';
import 'database/store.service.dart';
import 'home/home.menu.service.dart';

class MainServices {
  Future index() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await GetStorage.init('store');
    await openServices();
  }

  Future<void> openServices() async {
    Get.lazyPut<GetConnect>(() => GetConnect());
    await Get.putAsync(() => HomeMenuService().init());
    await Get.putAsync(() => StoreService().init());
    await Get.putAsync(() => AuthService().init());
    await Get.putAsync(() => DatabaseService().init());
  }
}
