import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/home/route/routes.dart';
import '../../../modules/profile/route/routes.dart';

class HomeMenuService extends GetxService {
  Future<HomeMenuService> init() async => this;
  RxInt menuIndex = 0.obs;
  RxInt menuIndexOld = 0.obs;
  List<Map<dynamic, dynamic>> menuList = [
    {
      "icon": "assets/home-icon.svg",
      "name": "Home"
    },
    {
      "icon": "assets/menu-icon.svg",
      "name": "Menu"
    },
    {
      "icon": "assets/cart-icon.svg",
      "name": "Cart"
    },
    {
      "icon": "assets/user-icon.svg",
      "name": "Profile"
    },
  ];

  void menuChange(BuildContext context, int index) {
    menuIndexOld.value = menuIndex.value;
    menuIndex.value = index;
    switch (index) {
      case 0:
        Get.toNamed(HomeRoutes.home);
        break;
      case 1:
        // Get.toNamed(ProfileRoutes.profile);
        break;
      case 2:
        // Get.toNamed(CandiatesRoutes.cadidatesView);
        print(index);
        break;
      case 3:
        Get.toNamed(ProfileRoutes.profile);
        break;
    }
  }

  Function() backwindow() {
    return () {
      menuIndex.value = menuIndexOld.value;
      Get.back();
    };
  }
}
