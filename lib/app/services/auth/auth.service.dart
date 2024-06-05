import 'package:get/get.dart';
// ignore: unused_import
import 'dart:developer' as dev;

import '../../../modules/auth/models/login.model.dart';
import '../../../modules/home/route/routes.dart';
import '../../common/models/http.headers.dart';
import '../database/store.service.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    await authCheck();
    return this;
  }

  final ss = Get.find<StoreService>();

  RxBool authenticate = false.obs;
  RxBool firstOpen = false.obs;
  Rx<HttpHeaderApi> headers = HttpHeaderApi().obs;

  Rx<MLogin?> auth = MLogin().obs;

  // Socal
  // GoogleSignIn googleSignIn = GoogleSignIn();

  // Agora Info
  final String appId = "";

  Future<void> authCheck() async {
    if (ss.db.read('auth') != null) {
      dev.log(ss.db.read('auth'));
      auth.value = mLoginFromJson(ss.db.read('auth'));
      if (auth.value != null) {
        headers.value.authorization = "${auth.value!.token}";
        authenticate.value = true;
      } else {
        headers.value = HttpHeaderApi();
        authenticate.value = false;
        auth.value = MLogin();
        ss.db.remove('auth');
      }
    } else {
      headers.value = HttpHeaderApi();
      authenticate.value = false;
      auth.value = MLogin();
    }
  }

  // logout
  Future<void> signOut() async {
    print("--- Go to login (Logout) ---");
    // googleSignIn.disconnect();
    if (ss.db.read('auth') != null) {
      MLogin? auth = mLoginFromJson(ss.db.read('auth'));
      if (auth.token != null) {
        ss.db.remove('auth').then((_) {
          authCheck().then((__) {
            Get.offAllNamed(HomeRoutes.home);
          });
        });
      }
    } else {
      authCheck().then((__) {
        Get.offAllNamed(HomeRoutes.home);
      });
    }
  }
}
