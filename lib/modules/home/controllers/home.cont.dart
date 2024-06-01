import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../app/services/auth/auth.service.dart';

class HomeController extends GetxController {
  final as = Get.find<AuthService>();

  @override
  void onInit() async {
    super.onInit();
    Future.delayed(Duration(seconds: 2)).then((value) => FlutterNativeSplash.remove());
  }
}
