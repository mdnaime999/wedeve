import 'package:get/get.dart';

import '../controllers/auth.cont.dart';
import '../views/login.view.dart';
import '../views/sign.up.succesful.dart';
import '../views/signup.view.dart';

class AuthRoutes {
  static String login = "/login";
  static String signup = "/signup";
  static String signUpSuccess = "/sign/up/success";

  static List<GetPage> routes = [
    GetPage(
      name: login,
      page: () => LoginView(),
      bindings: [
        AuthBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: signup,
      page: () => SignUpView(),
      bindings: [
        AuthBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: signUpSuccess,
      page: () => SignUpSuccessful(),
      bindings: [
        AuthBindings()
      ],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
