import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../config/fields/input.field.dart';
import '../controllers/profile.cont.dart';

class AccountView extends StatelessWidget {
  AccountView({super.key});
  final ProfileController profileCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ------------------------------------------------------------ Email
        FieldLable(lable: "Email", lableColors: Colors.grey.shade600),
        Container(
          margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: InputFieldTwo(
            hintText: "example@domain.com",
            hintStyle: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
            controller: null,
          ),
        ),
        // ------------------------------------------------------------ Full Name
        FieldLable(lable: "Full Name", lableColors: Colors.grey.shade600),
        Container(
          margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: InputFieldTwo(
            hintText: "Enter your full name",
            hintStyle: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
            controller: null,
          ),
        ),
        // ------------------------------------------------------------ Street Address
        FieldLable(lable: "Street Address", lableColors: Colors.grey.shade600),
        Container(
          margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: InputFieldTwo(
            hintText: "Enter your address",
            hintStyle: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
            controller: null,
          ),
        ),
        // ------------------------------------------------------------ Apt, Suite, Bldg (optional)
        FieldLable(lable: "Apt, Suite, Bldg (optional)", lableColors: Colors.grey.shade600),
        Container(
          margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: InputFieldTwo(
            hintText: "Enter apt, suite, bldg (optional)",
            hintStyle: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
            controller: null,
          ),
        ),
        // ------------------------------------------------------------ Email
        FieldLable(lable: "Zip Code", lableColors: Colors.grey.shade600),
        Container(
          width: 25.w,
          margin: EdgeInsets.only(bottom: 10.sp, top: 2.sp),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: InputFieldTwo(
            hintText: "Enter zip code",
            hintStyle: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
            controller: null,
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
                    padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                  ),
                  onPressed: () {},
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
                    padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: GoogleFonts.roboto(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
