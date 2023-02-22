import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> dates = ["22 Feb 2023", "22 Feb 2023", "22 Feb 2023", "22 Feb 2023"];
    List<String> transactions = ["Moon Chicken", "Sate Taichan", "Babi bakar"];

    Widget buildTransaction(String transaction){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        height: size.height * 0.07,
        width: size.width * 0.85,
        decoration: BoxDecoration(
          color: Color(0xFFf1f1fa),
          borderRadius: BorderRadius.circular(24)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Container(
            width: 150,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(transaction, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0XFF456581)),),
              Text("Baru Saja", style: TextStyle(fontSize: 12),)
            ],
          )),
          Text("- Rp. 10.000", style: TextStyle(color: Colors.red),)
        ]),
      );
    }

    Widget buildDate(String date) {
      // return ListTile(
      //   title: Text("22 Februari 2023"),
      // );
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date, style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),),
            Container(
          child: Column(
            children: [
              for (final item in transactions)
                buildTransaction(item)
            ],
          ),
        ),
          ],
        ),
        );
    }



    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(color: kPrimaryColor),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.all(kDefaultPadding),
            child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              for (final item in dates)
                buildDate(item)
            ])),
            height: size.height * 0.8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(size.height * 0.04))),
          ),
        )
      ]),
    );
  }
}
