import 'package:course_app/widgets/category_card/loading_category_card.dart';
import 'package:course_app/widgets/recent_transaction_card/loading_recent_transaction_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:course_app/widgets/category_card/category_card.dart';
import 'package:course_app/widgets/recent_transaction_card/recent_transaction_card.dart';
import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.onTapNavigate});

  final Function? onTapNavigate;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCategoryReady = false;
  bool isExpenseReady = false;
  bool isRecentTransactionReady = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ini init home");
    fetchCategory();
    fetchRecent();
  }

  Future<void> fetchCategory() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isCategoryReady = true;
    });
  }

  Future<void> fetchExpense() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      isExpenseReady = true;
    });
  }

  Future<void> fetchRecent() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isRecentTransactionReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const numItems = 3;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 120.h,
            child: Stack(
              children: [
                Container(
                  height: 120.h - 45.h,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                      // alignment: Alignment.center,
                      height: 90.h,
                      margin: EdgeInsets.symmetric(horizontal: 18.r),
                      padding: EdgeInsets.symmetric(horizontal: 18.r),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                blurRadius: 5,
                                color: kPrimaryColor.withOpacity(0.3))
                          ]),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/rupiah.png",
                            height: 45.h,
                          ),
                          SizedBox(
                            width: 27.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 6.h),
                              Text(
                                "Pengeluaran Bulan Ini",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Rp 2.920.000,00",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 18.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kategori Bulan Ini",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 13.r, vertical: 12.r),
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(2),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: isCategoryReady
                    ? Row(children: [
                        CategoryCard(),
                        CategoryCard(),
                        CategoryCard(),
                        CategoryCard(),
                        CategoryCard(),
                      ])
                    : Row(children: [
                        LoadingCategoryCard(),
                        LoadingCategoryCard(),
                        LoadingCategoryCard(),
                      ]),
              )),
          SizedBox(
            height: 14.h,
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 18.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Transaksi Terakhir",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  GestureDetector(
                      onTap: () => {widget.onTapNavigate!(1)},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Lihat Semua",
                            style: TextStyle(
                                fontWeight: FontWeight.w100, fontSize: 13.sp),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 13.h,
                          )
                        ],
                      ))
                ],
              )),
          Container(
              // padding: EdgeInsets.symmetric(horizontal: size.width * 4/360),
              margin: EdgeInsets.symmetric(horizontal: 6.r, vertical: 16.r),
              child: isRecentTransactionReady
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      primary: false,
                      shrinkWrap: true,
                      itemCount: numItems * 2,
                      itemBuilder: ((context, i) {
                        if (i.isOdd) return const Divider();
                        final index = i ~/ 2;
                        return RecentTransactionCard(
                          index: index,
                        );
                      }),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 3 * 2,
                      itemBuilder: ((context, i) {
                        if (i.isOdd) return const Divider();
                        final index = i ~/ 2;
                        return LoadingRecentTransactionCard(
                          index: index,
                        );
                      }),
                    )),
        ],
      ),
    ));
  }
}
