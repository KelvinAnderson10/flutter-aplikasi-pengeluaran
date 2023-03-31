import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RecentTransactionCard extends StatelessWidget {
  const RecentTransactionCard({super.key, this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        minVerticalPadding: 6,
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.orange.withOpacity(0.2),
            child: Icon(
              Icons.fastfood,
              color: Colors.orange,
              // size: 16
            ),
          )
          // Icon(Icons.fastfood)
        ]),
        title: Text("Moon Chicken", style: TextStyle(fontSize: 16.sp),),
        visualDensity: VisualDensity(vertical: -4),
        subtitle: Text("Makanan", style: TextStyle(fontSize: 14.sp),),
        trailing: Text(
          "- Rp. 10.000",
          style: TextStyle(color: Colors.red, fontSize: 14.sp),
        ),
      );;
  }
}