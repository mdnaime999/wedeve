import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StoreService extends GetxService {
  Future<StoreService> init() async {
    return this;
  }

  GetStorage db = GetStorage('store');

  // ---- Firebase ----
  RxString fcmToken = "".obs;
}
