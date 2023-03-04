import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundColor: Colors.orange.withOpacity(0.2),
            child: Icon(
              Icons.fastfood,
              color: Colors.orange,
            ),
          ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          "Makanan",
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          "Rp. 500.000",
          style: TextStyle(fontSize: 13.sp, color: Colors.black.withOpacity(0.6)),
        ),
      ]),
    );
  }
}
