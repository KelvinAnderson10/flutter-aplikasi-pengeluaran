import 'package:course_app/components/home_view.dart';
import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget with HomeView {
  const HomeScreen({super.key, this.onTapNavigate});

  final Function? onTapNavigate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const numItems = 3;
    Widget buildRow(int idx) {
      return ListTile(
        minVerticalPadding: 6,
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            // radius: 18,
            backgroundColor: Colors.orange.withOpacity(0.2),
            child: Icon(
              Icons.fastfood,
              color: Colors.orange,
              // size: 16
            ),
          )
          // Icon(Icons.fastfood)
        ]),
        title: Text("Moon Chicken"),
        visualDensity: VisualDensity(vertical: -4),
        subtitle: Text("Makanan"),
        trailing: Text(
          "- Rp. 10.000",
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.25,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.25 - size.height * 0.07,
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36))),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.018, left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selamat Datang,",
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.height * 0.022))),
                      const SizedBox(height: 6),
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
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
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 6),
                              Text(
                                "Pengeluaran Bulan Ini",
                                style: TextStyle(
                                    fontSize: size.height * 0.022,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              const SizedBox(height: 5),
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
            height: 16,
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kategori Bulan Ini",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              )),
          Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding),
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(2),
                scrollDirection: Axis.horizontal,
                child: Wrap(spacing: 16, children: [
                  categoryCard(size),
                  categoryCard(size),
                  categoryCard(size),
                  categoryCard(size),
                  categoryCard(size),
                ]),
              )),
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transaksi Terakhir",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    height: 26.0,
                    minWidth: 5,
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    child: new Text(
                      "Lihat Semua",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    onPressed: () => {onTapNavigate!(1)},
                  )
                ],
              )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                primary: false,
                // padding: const EdgeInsets.only(right: 2),
                shrinkWrap: true,
                itemCount: numItems * 2,
                itemBuilder: ((context, i) {
                  if (i.isOdd) return const Divider();
                  final index = i ~/ 2 + 1;
                  return buildRow(index);
                }),
              )),
        ],
      ),
    ));
  }
}
