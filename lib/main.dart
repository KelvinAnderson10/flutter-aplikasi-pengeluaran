import 'package:course_app/screens/dashboard_screen.dart';
import 'package:course_app/screens/home_screen.dart';
import 'package:course_app/screens/profile_screen.dart';
import 'package:course_app/screens/transaction_screen.dart';
import 'package:course_app/widgets/bottom_navigation_bar.dart';
import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //   SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          // textTheme: GoogleFonts.rubikTextTheme(),
          fontFamily: 'Rubik',
          appBarTheme: const AppBarTheme(
              backgroundColor: kPrimaryColor,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: kPrimaryColor)),
        ),
        home: child);
  },
  child:  const MyHomePage(),
  );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTab = 0;

  late dynamic pages = [
    HomeScreen(onTapNavigate: pageChange),
    TransactionScreen(),
    DashboardScreen(),
    ProfileScreen(),
  ];

  void pageChange(int index){
    setState(() {
      currentTab = index;
    });
  }

  final titleAppBar = ["MyDompet", "Transaksi", "Dashboard", "Profile"];

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
        body: pages[currentTab],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
            MyBottomNavigationBar(onTapped: pageChange, index: currentTab));
  }
}
