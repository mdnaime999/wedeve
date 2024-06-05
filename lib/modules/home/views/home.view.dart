import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart' as svg;
import 'package:cached_network_image/cached_network_image.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../app/common/widgets/rich.widget.dart';
import '../../../config/config.dart';
import '../controllers/home.cont.dart';
import '../models/product.model.dart';
import '../widgets/home.menu.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController homeCont = Get.find();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return WillPopScope(
      onWillPop: () => appClose(),
      child: Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        body: Column(
          children: [
            // ----------------------------------------- App Bar
            SafeArea(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 5.w),
                    Text(
                      "Product List",
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
            // ----------------------------------------- Filter
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.sp),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), //color of shadow
                    spreadRadius: 1, //spread radius
                    blurRadius: 2, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: homeCont.filterProduct,
                    child: CustomRich(
                      first: svg.SvgPicture.asset("assets/settings-icon.svg"),
                      secend: Text(
                        "Filter",
                        style: GoogleFonts.roboto(
                          fontSize: 13.sp,
                          color: Color(0xFF818995),
                        ),
                      ),
                    ),
                  ),
                  CustomRich(
                    first: CustomRich(
                      first: Text(
                        "Sort by",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          color: Color(0xFF818995),
                        ),
                      ),
                      secend: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF818995),
                      ),
                    ),
                    secend: Icon(
                      Icons.list,
                    ),
                  ),
                ],
              ),
            ),

            // ----------------------------------------- Product List
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                  padding: EdgeInsets.all(5.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.sp,
                    crossAxisSpacing: 10.sp,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: homeCont.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    MProduct item = homeCont.products[index];
                    return Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade100,
                        borderRadius: BorderRadius.circular(10.sp),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), //color of shadow
                            spreadRadius: 1, //spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(2, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageBuilder: (context, imageProvider) => Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.hide_image_outlined,
                                color: Colors.grey,
                                size: 20.w,
                              ),
                              imageUrl: item.images[0].src,
                            ),
                          ),
                          Container(
                            width: 100.w,
                            color: Colors.white,
                            padding: EdgeInsets.all(10.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: GoogleFonts.roboto(
                                    fontSize: 12.sp,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5.sp),
                                CustomRich(
                                  first: Text(
                                    "\$${item.regularPrice}",
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontSize: 11.sp,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  secend: Text(
                                    "\$${item.price}.00",
                                    style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.sp),
                                RatingBar.builder(
                                  initialRating: double.parse(item.averageRating),
                                  minRating: 1,
                                  maxRating: 5,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15.sp,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  ignoreGestures: true,
                                  onRatingUpdate: (rating) {},
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
        floatingActionButton: ActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: HomeMenu(),
      ),
    );
  }
}
// 01811425668
// 0179719051465
