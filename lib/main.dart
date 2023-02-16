import 'package:course_app/components/history_screen.dart';
import 'package:course_app/components/home_screen.dart';
import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(),
        appBarTheme: const AppBarTheme(
            backgroundColor: kPrimaryColor,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: kPrimaryColor)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  final pages = <Widget>[
    const HomeScreen(),
    const HistoryScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
          tooltip: 'Tambah Transaksi Baru',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => {
                  setState(() => {_index = 0})
                },
                color: _index == 0 ? kPrimaryColor : Colors.grey,
              )),
              Expanded(
                  child: IconButton(
                icon: const Icon(
                  Icons.receipt_long,
                ),
                onPressed: () => {
                  setState(() => {_index = 1})
                },
                color: _index == 1 ? kPrimaryColor : Colors.grey,
              )),
              const Expanded(child: SizedBox()),
              Expanded(
                  child: IconButton(
                icon: const Icon(
                  Icons.leaderboard,
                ),
                onPressed: () => {
                  setState(() => {_index = 2})
                },
                color: _index == 2 ? kPrimaryColor: Colors.grey,
              )),
              Expanded(
                  child: IconButton(
                icon: const Icon(
                  Icons.person,
                ),
                onPressed: () => {
                  setState(() => {_index = 3})
                },
                color: _index == 3 ? kPrimaryColor : Colors.grey,
              )),
            ],
          )),
    );
  }
}
