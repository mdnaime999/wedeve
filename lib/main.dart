import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app/services/main.service.dart';
import 'config/config.dart';
import 'config/diloags/smart.toast.dart';
import 'config/routings.dart';
import 'config/themes/theme.dart';
import 'config/translation/traslation.dart';
import 'modules/home/route/routes.dart';

void main() async {
  await MainServices().index();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        jointRoute(); // --- inportent ---
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: appName,
          translations: MyTranslations(),
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          initialBinding: HomeBindings(),
          initialRoute: HomeRoutes.home,
          getPages: routes,
          theme: getTheme,
          navigatorObservers: [
            FlutterSmartDialog.observer
          ],
          builder: FlutterSmartDialog.init(
            toastBuilder: (String msg) => CustomToast(msg),
          ),
        );
      },
    );
  }
}
