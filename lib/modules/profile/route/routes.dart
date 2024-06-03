import 'package:get/get.dart';

import '../../../app/middlewares/auth/auth.middleware.dart';
import '../controllers/profile.cont.dart';
import '../views/profile.view.dart';

class ProfileRoutes {
  static String profile = "/profile";
  static String accountInfo = "/accountInfo";

  static List<GetPage> routes = [
    GetPage(
      name: profile,
      page: () => ProfileView(),
      bindings: [
        ProfileBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
      middlewares: [
        AuthGuard(),
      ],
    ),
  ];
}

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}
