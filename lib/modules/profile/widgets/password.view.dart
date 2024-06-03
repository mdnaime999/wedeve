import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/profile.cont.dart';

class PasswordView extends StatelessWidget {
  PasswordView({super.key});
  final ProfileController profileCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      alignment: Alignment.center,
      child: Text("Password"),
    );
  }
}
