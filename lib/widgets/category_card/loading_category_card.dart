import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCategoryCard extends StatelessWidget {
  const LoadingCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.r),
        height: 120.h,
        // padding: EdgeInsets.symmetric(vertical: 16.r),
        width: 110.w,
        // padding: EdgeInsets.symmetric(horizontal: 6.r),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  blurRadius: 5,
                  color: Colors.grey.withOpacity(0.3)),
            ]),
        child: Shimmer.fromColors(
          // baseColor: kPrimaryColor.withOpacity(0.2),
          // highlightColor: kPrimaryColor.withOpacity(0.1),
          baseColor: (Colors.grey[200]!),
          highlightColor: (Colors.grey[100]!),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 14.h,
            ),
            Container(
              width: 68.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              height: 6.h,
            ),
            Container(
              width: 64.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)),
            ),
          ]),
        ));
  }
}
