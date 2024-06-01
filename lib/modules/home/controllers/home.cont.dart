import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../app/services/auth/auth.service.dart';
import '../models/product.model.dart';

class HomeController extends GetxController {
  final as = Get.find<AuthService>();

  RxList<MProduct> products = RxList<MProduct>([]);
  RxList<MProduct> filterProducts = RxList<MProduct>([]);

  RxBool newest = false.obs;

  @override
  void onInit() async {
    super.onInit();
    Future.delayed(Duration(seconds: 2)).then((value) => FlutterNativeSplash.remove());
    getProducts();
  }

  Future<void> getProducts() async {
    String response = await rootBundle.loadString("assets/response.json");
    List<MProduct> productList = mProductFromJson(response);
    products.clear();
    for (MProduct product in productList) {
      products.add(product);
    }
  }

  Future<void> filterProduct() async {
    if (newest.value) {
      products.sort(
        (a, b) {
          return b.dateCreated.compareTo(a.dateCreated);
        },
      );
    }
  }
}
