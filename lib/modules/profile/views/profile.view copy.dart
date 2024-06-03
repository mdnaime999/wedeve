import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:sizer/sizer.dart';
import 'package:wedevs/app/common/class/toavater.dart';

import '../../../config/config.dart';
import '../../home/widgets/home.menu.dart';
import '../controllers/profile.cont.dart';
import '../models/enpansion.model.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final ProfileController profileCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => appClose(),
      child: Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        body: Obx(() {
          return Column(
            children: [
              // ----------------------------------------- App Bar
              SafeArea(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 5.w),
                  child: Text(
                    "My Account",
                    style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ----------------------------------------- Profile Photo
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.sp),
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        border: DashedBorder.fromBorderSide(
                          dashLength: 3,
                          side: BorderSide(color: Colors.red, width: 0.6.sp),
                        ),
                        borderRadius: BorderRadius.circular(50.w),
                      ),
                      child: CircleAvatar(
                        radius: 15.w,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: CachedNetworkImageProvider(ToAvater(name: profileCont.as.auth.value!.userDisplayName!).getUrl()),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 1000),
                        expansionCallback: (int index, bool isExpanded) {},
                        elevation: 4,
                        children: profileExpansions.map(
                          (ProfileExpansion item) {
                            return ExpansionPanel(
                              backgroundColor: Colors.white,
                              headerBuilder: (context, isExpanded) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  padding: EdgeInsets.all(10.sp),
                                  child: Text(
                                    item.name,
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                );
                              },
                              body: Container(
                                padding: EdgeInsets.all(20.sp),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }),
        floatingActionButton: ActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: HomeMenu(),
      ),
    );
  }
}
