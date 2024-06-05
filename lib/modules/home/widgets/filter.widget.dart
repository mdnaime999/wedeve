import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../config/fields/input.field.dart';
import '../controllers/home.cont.dart';
import '../models/filter.ceeckbox.model.dart';

class FilterSheet extends StatelessWidget {
  FilterSheet({super.key});
  final HomeController homeCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.all(15.sp),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ------------------------------------------------------------ Bar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40.w),
              child: Divider(color: Colors.red.shade100, thickness: 2.sp),
            ),
            // ------------------------------------------------------------ Title
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: FieldLable(
                lable: "Filter",
                lableStyle: GoogleFonts.roboto(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // ------------------------------------------------------------ Checkboxs
            Expanded(
              child: Column(
                children: filterCheckList.map((FilterCheckbox item) {
                  return CheckboxListTile(
                    value: item.isActive.value,
                    onChanged: (v) {
                      item.isActive.value = v!;
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity, horizontal: VisualDensity.minimumDensity),
                    contentPadding: EdgeInsets.zero,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.sp),
                    ),
                    side: BorderSide(color: Colors.red.shade300, width: 1.sp),
                    activeColor: Colors.red.shade300,
                    title: Text(
                      item.title,
                      style: GoogleFonts.roboto(fontSize: 12.sp),
                    ),
                  );
                }).toList(),
              ),
            ),
            // ------------------------------------------------------------ Submit Botton
            Container(
              margin: EdgeInsets.only(bottom: 10.sp),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                      ),
                      onPressed: () {
                        for (FilterCheckbox filterCheck in filterCheckList) {
                          filterCheck.isActive.value = false;
                        }
                        Get.back();
                      },
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                      ),
                      onPressed: homeCont.filterQuery,
                      child: Text(
                        "Apply",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
