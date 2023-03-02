import 'package:course_app/widgets/category_card.dart';
import 'package:course_app/widgets/recent_transaction_card.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ini init home");
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
            height: size.height * 0.25,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.25 - size.height * 0.07,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.018, left: size.width * 18 / 360),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selamat Datang,",
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.022))),
                      SizedBox(height: size.height * 6 / 780),
                      Text("Kelvin Anderson",
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.028))),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                      // alignment: Alignment.center,
                      height: size.height * 0.14,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * kDefaultPadding / 360),
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * kDefaultPadding / 360),
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
                            height: size.height * 1 / 13,
                          ),
                          SizedBox(
                            width: size.width * 16 / 360,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: size.height * 6 / 780),
                              Text(
                                "Pengeluaran Bulan Ini",
                                style: TextStyle(
                                    fontSize: size.height * 0.022,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              SizedBox(height: size.height * 5 / 780),
                              Text(
                                "Rp 2.500.000,00",
                                style: TextStyle(
                                    fontSize: size.height * 0.03,
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
            height: size.height * 16 / 780,
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * kDefaultPadding / 360),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kategori Bulan Ini",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 18 / 780),
                  ),
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * kDefaultPadding / 360,
                  vertical: size.height * kDefaultPadding / 780),
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(2),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Wrap(spacing: size.width * 16 / 360, children: [
                  CategoryCard(),
                  CategoryCard(),
                  CategoryCard(),
                  CategoryCard(),
                  CategoryCard(),
                ]),
              )),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * kDefaultPadding / 360),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Transaksi Terakhir",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 18 / 780),
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
                                fontWeight: FontWeight.w100,
                                fontSize: size.height * 14 / 780),
                          ),
                          SizedBox(
                            width: size.width * 4 / 360,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: size.height * 20 / 780,
                          )
                        ],
                      ))
                  // MaterialButton(
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(50.0)),
                  //   height: size.height * 26 / 780,
                  //   minWidth: size.width * 5 / 360,
                  //   color: kPrimaryColor,
                  //   textColor: Colors.white,
                  //   child: Text(
                  //     "Lihat Semua",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: size.height * 12 / 780),
                  //   ),
                  //   onPressed: () => {onTapNavigate!(1)},
                  // )
                ],
              )),
          Container(
              // padding: EdgeInsets.symmetric(horizontal: size.width * 4/360),
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 6 / 360,
                  vertical: size.height * kDefaultPadding / 780),
              child: ListView.builder(
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
              )),
        ],
      ),
    ));
  }
}
