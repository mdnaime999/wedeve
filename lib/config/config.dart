import '../modules/auth/route/routes.dart';
import '../modules/home/route/routes.dart';
import '../modules/profile/route/routes.dart';

String appName = "Dokan";

// GetStorage db = GetStorage('store');
// ============= app modules
List modules = [
  HomeRoutes.routes,
  AuthRoutes.routes,
  ProfileRoutes.routes,
];

class AppSettings {}

Future<bool> appClose() async {
  // Get.dialog(
  //   ShowDialogWithBody(
  //     title: "Attention please !!",
  //     body: Container(
  //       padding: EdgeInsets.all(10.sp),
  //       decoration: BoxDecoration(
  //         border: Border.all(color: appThemeColor),
  //         borderRadius: BorderRadius.circular(10.sp),
  //       ),
  //       child: Text(
  //         "Do you want to close this application ?",
  //         style: GoogleFonts.openSans(
  //           color: appThemeColor,
  //           fontSize: 12.sp,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //     submitText: "Exit",
  //     submitFun: () async {
  //       Get.back();
  //       SystemNavigator.pop(animated: true);
  //     },
  //   ),
  //   barrierDismissible: false,
  // );
  return false;
}
