import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

import '../../../app/services/auth/auth.service.dart';

class ProfileController extends GetxController {
  final as = Get.find<AuthService>();

  Rx<ExpandableController?> controller = ExpandableController().obs;

  @override
  void onInit() {
    super.onInit();
    controller.value!.expanded = false;
  }
}
