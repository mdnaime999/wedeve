import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:sizer/sizer.dart';

import '../../../app/common/class/toavater.dart';
import '../../../app/common/widgets/rich.widget.dart';
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
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ----------------------------------------- Profile Photo
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4.h),
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
                      SizedBox(height: 2.h),
                      // ----------------------------------------- Profile info
                      Column(
                        children: [
                          Text(
                            profileCont.as.auth.value!.userDisplayName!.capitalize!,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            profileCont.as.auth.value!.userEmail!,
                            style: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      // ----------------------------------------- Profile Settings
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 15.sp),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            ProfileExpansion item = profileExpansions[index];
                            return ExpandablePanel(
                              theme: ExpandableThemeData(
                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                tapBodyToCollapse: true,
                                expandIcon: Icons.keyboard_arrow_right_rounded,
                                collapseIcon: Icons.keyboard_arrow_down_rounded,
                                iconSize: 20.sp,
                                iconPadding: EdgeInsets.zero,
                              ),
                              header: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                                    child: SvgPicture.asset(
                                      item.icon,
                                      width: 5.w,
                                      height: 5.w,
                                    ),
                                  ),
                                  SizedBox(width: 10.sp),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 15.sp),
                                      child: CustomRich(
                                        first: Text(
                                          item.name,
                                        ),
                                        secend: item.id == 4
                                            ? Text(
                                                "(00)",
                                                style: GoogleFonts.roboto(
                                                  color: Colors.grey,
                                                  fontSize: 12.sp,
                                                ),
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              collapsed: SizedBox(),
                              expanded: item.page,
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.grey,
                            thickness: 0.3.sp,
                            height: 0.3.sp,
                          ),
                          itemCount: profileExpansions.length,
                        ),
                      ),
                    ],
                  ),
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
