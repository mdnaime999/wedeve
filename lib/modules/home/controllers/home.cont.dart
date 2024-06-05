import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../../app/services/auth/auth.service.dart';
import '../models/filter.ceeckbox.model.dart';
import '../models/product.model.dart';
import '../widgets/filter.widget.dart';

class HomeController extends GetxController {
  final as = Get.find<AuthService>();

  RxList<MProduct> products = RxList<MProduct>([]);
  RxList<MProduct> filterProducts = RxList<MProduct>([]);

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
    Get.bottomSheet(
      FilterSheet(),
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withOpacity(0.1),
    );
  }

  Future<void> filterQuery() async {
    List<FilterCheckbox> activeFilters = filterCheckList.where((item) => item.isActive.value == true).toList();

    for (FilterCheckbox activeFilter in activeFilters) {
      if (activeFilter.id == 1) {
        products.sort(
          (a, b) {
            return b.dateCreated.compareTo(a.dateCreated);
          },
        );
      } else if (activeFilter.id == 2) {
        products.sort(
          (a, b) {
            return a.dateCreated.compareTo(b.dateCreated);
          },
        );
      }
    }
    refresh();
    Get.back();
  }
}
