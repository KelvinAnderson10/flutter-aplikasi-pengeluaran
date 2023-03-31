import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingRecentTransactionCard extends StatelessWidget {
  const LoadingRecentTransactionCard({super.key, this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: (Colors.grey[200]!),
      highlightColor: (Colors.grey[100]!),
      child: ListTile(
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.white,
          )
          // Icon(Icons.fastfood)
        ]),
        title: Container(
          height: 12.h,
          margin: EdgeInsets.only(right: 80.r, bottom: 5.r),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
        ),
        visualDensity: VisualDensity(vertical: -4),
        subtitle: Container(
          height: 12.h,
          margin: EdgeInsets.only(right: 160.r),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
        ),
      ),
    );
  }
}
