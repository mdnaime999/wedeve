import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/auth/route/routes.dart';
import '../../services/auth/auth.service.dart';

class AuthGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.authenticate.value ? null : RouteSettings(name: AuthRoutes.login);
  }
}
