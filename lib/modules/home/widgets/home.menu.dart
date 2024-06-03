import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../app/services/home/home.menu.service.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({Key? key}) : super(key: key);
  final menuService = Get.find<HomeMenuService>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedBottomNavigationBar.builder(
        itemCount: menuService.menuList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Color(0xFFFF679B) : Color(0xFF6E7FAA);
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                menuService.menuList[index]['icon'],
                // ignore: deprecated_member_use
                color: color,
              ),
            ],
          );
        },
        backgroundColor: Colors.white,
        borderWidth: 0,
        activeIndex: menuService.menuIndex.value,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        scaleFactor: 0.2,
        onTap: (index) => menuService.menuChange(context, index),
      );
    });
  }
}

class ActionButton extends StatelessWidget {
  ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // backgroundColor: Colors.blue.shade700,
      clipBehavior: Clip.antiAlias,
      onPressed: () {},
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF679B), // 0% (begin)
              Color(0xFFFF7B51), // 100% (end)
            ],
          ),
        ),
        child: Icon(Icons.search),
      ),
    );
  }
}
