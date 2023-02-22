import 'package:course_app/components/bottom_navigation_bar.dart';
import 'package:course_app/components/transaction_screen.dart';
import 'package:course_app/components/home_screen.dart';
import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.rubikTextTheme(),
          appBarTheme: const AppBarTheme(
              backgroundColor: kPrimaryColor,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: kPrimaryColor)),
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTab = 0;

  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  Widget buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: [
        HomeScreen(
          onTapNavigate: bottomTapped,
        ),
        TransactionScreen(),
        HomeScreen(),
        HomeScreen(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      currentTab = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      currentTab = index;
      //   pageController.animateToPage(index,
      // duration: Duration(milliseconds: 500), curve: Curves.ease);
      pageController.jumpToPage(index);
    });
  }

  final titleAppBar = ["Overview", "Transaction", "Dashboard", "Profile"];

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBody: true,
        appBar: AppBar(
            // toolbarHeight: 80,
            elevation: 0,
            // leading: SvgPicture.asset(dompetLogo),
            title: Row(
              children: [
                Image.asset("assets/dompet.png", height: 20,),
                SizedBox(width: 12,),
                Text(
                  titleAppBar[currentTab],
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            )
            // actions: <Widget>[
            //   Container(
            //     margin: EdgeInsets.only(right: 20),
            //     child: Row(children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text("Hello Kelvin"),
            //           Text("Hello Kelvin"),
            //         ],
            //       ),
            //       SizedBox(width: 10,),
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [CircleAvatar()],
            //       )
            //     ]),
            //   )
            // ],
            // centerTitle: true,
            ),
        body: buildPageView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
            MyBottomNavigationBar(onTapped: bottomTapped, index: currentTab));
  }
}
